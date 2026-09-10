#!/usr/bin/env python3
# Copyright 2026 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""Automated drift detector for Google SecOps detection rules.

Queries the Chronicle API to detect rules created or modified in the web console,
updates local files, and generates declarative Terraform import blocks in 'terraform/drift_imports.tf'
so that changes can be imported via an automated Pull Request without 409 conflicts.
"""

import json
import logging
import os
import pathlib
import yaml

import dotenv
from google.auth.transport import requests
from tools.secops_content_manager.google_secops_api import auth
from tools.secops_content_manager.google_secops_api.rules.list_rule_deployments import list_rule_deployments
from tools.secops_content_manager.google_secops_api.rules.list_rules import list_rules
from tools.secops_content_manager.content_manager.rules import Rules

logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")
LOGGER = logging.getLogger("drift_detector")

REPO_ROOT = pathlib.Path(__file__).parent.parent
RULES_DIR = REPO_ROOT / "content" / "secops" / "rules"
DRIFT_IMPORTS_FILE = REPO_ROOT / "terraform" / "drift_imports.tf"

dotenv.load_dotenv()


def initialize_http_session() -> requests.AuthorizedSession:
    """Initialize an authorized session to the Chronicle API."""
    return auth.initialize_http_session(
        scopes=json.loads(os.environ.get("AUTHORIZATION_SCOPES", '{"GOOGLE_SECOPS_API":["https://www.googleapis.com/auth/cloud-platform"]}')).get(
            "GOOGLE_SECOPS_API"
        )
    )


def detect_and_reconcile():
    """Detect remote rules and reconcile local files and import blocks."""
    session = initialize_http_session()
    LOGGER.info("Retrieving remote rules from Google SecOps...")

    remote_rules = Rules.get_remote_rules(http_session=session)
    if not remote_rules.rules:
        LOGGER.info("No remote rules found.")
        return

    # Index local rules
    local_rules = Rules.load_rules(rules_dir=RULES_DIR)
    local_rules_by_name = {r.name: r for r in local_rules.rules}

    new_imports = []
    changes_detected = 0

    for remote_rule in remote_rules.rules:
        rule_name = remote_rule.name
        local_rule = local_rules_by_name.get(rule_name)

        if not local_rule:
            # New rule created in the SecOps console
            LOGGER.info("Detected NEW rule created in console: %s (ID: %s)", rule_name, remote_rule.id)
            changes_detected += 1

            # Write .yaral
            yaral_path = RULES_DIR / f"{rule_name}.yaral"
            with open(yaral_path, "w", encoding="utf-8") as f:
                f.write(remote_rule.text)

            # Write sanitized .yaml
            yaml_path = RULES_DIR / f"{rule_name}.yaml"
            clean_config = {
                "enabled": remote_rule.enabled,
                "alerting": remote_rule.alerting,
                "run_frequency": remote_rule.run_frequency or "LIVE",
                "archived": remote_rule.archived or False,
            }
            with open(yaml_path, "w", encoding="utf-8") as f:
                yaml.dump(clean_config, f, sort_keys=False)

            # Generate declarative import block
            new_imports.append(f"""import {{
  to = module.chronicle_rules.google_chronicle_rule.rules["{rule_name}"]
  id = "projects/${{var.project_id}}/locations/${{var.chronicle_location}}/instances/${{var.chronicle_instance_id}}/rules/{remote_rule.id}"
}}

import {{
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["{rule_name}"]
  id = "projects/${{var.project_id}}/locations/${{var.chronicle_location}}/instances/${{var.chronicle_instance_id}}/rules/{remote_rule.id}/deployment"
}}
""")
        else:
            # Rule exists locally; check for drift in logic or deployment settings
            text_changed = Rules.compare_rule_text(local_rule.text, remote_rule.text)
            deployment_changed = (
                local_rule.enabled != remote_rule.enabled
                or local_rule.alerting != remote_rule.alerting
                or local_rule.run_frequency != remote_rule.run_frequency
                or local_rule.archived != remote_rule.archived
            )

            if text_changed or deployment_changed:
                LOGGER.info("Detected DRIFT in existing rule: %s", rule_name)
                changes_detected += 1

                if text_changed:
                    yaral_path = RULES_DIR / f"{rule_name}.yaral"
                    with open(yaral_path, "w", encoding="utf-8") as f:
                        f.write(remote_rule.text)

                yaml_path = RULES_DIR / f"{rule_name}.yaml"
                clean_config = {
                    "enabled": remote_rule.enabled,
                    "alerting": remote_rule.alerting,
                    "run_frequency": remote_rule.run_frequency or "LIVE",
                    "archived": remote_rule.archived or False,
                }
                with open(yaml_path, "w", encoding="utf-8") as f:
                    yaml.dump(clean_config, f, sort_keys=False)

    if new_imports:
        header = [
            "# Auto-generated declarative import blocks for newly detected console rules\n",
            "# Run 'terraform plan' to verify that imports resolve cleanly.\n\n"
        ]
        with open(DRIFT_IMPORTS_FILE, "w", encoding="utf-8") as f:
            f.writelines(header + new_imports)
        LOGGER.info("Wrote %d new import blocks to %s", len(new_imports), DRIFT_IMPORTS_FILE)

    LOGGER.info("Drift detection completed. Total modified/new rules: %d", changes_detected)


if __name__ == "__main__":
    detect_and_reconcile()
