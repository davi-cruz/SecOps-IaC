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
"""Decommission and archive Google SecOps YARA-L rules safely with Terraform moved blocks.

This script:
1. Renames the rule file and moves it to 'content/secops/rules/archived/'.
2. Updates the YARA-L rule header in-place with the commit SHA suffix (freeing the original rule name).
3. Sets 'archived: true', 'enabled: false', 'alerting: false' in the YAML config.
4. Appends declarative Terraform 'moved' blocks to 'terraform/moves.tf' to preserve state identity
   and update in-place during 'terraform apply' without destructive recreations.

Usage:
    python tools/archive_rule.py --rule <rule_name>
"""

import argparse
import logging
import pathlib
import re
import subprocess
import yaml

logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")
LOGGER = logging.getLogger("archive_rule")

REPO_ROOT = pathlib.Path(__file__).parent.parent
RULES_DIR = REPO_ROOT / "content" / "secops" / "rules"
ARCHIVED_DIR = RULES_DIR / "archived"
MOVES_FILE = REPO_ROOT / "terraform" / "moves.tf"


def get_commit_sha() -> str:
    """Retrieve short Git commit SHA, falling back to a timestamp if not in git."""
    try:
        commit_sha = subprocess.check_output(
            ["git", "rev-parse", "--short", "HEAD"],
            stderr=subprocess.DEVNULL
        ).decode("utf-8").strip()
        if commit_sha:
            return commit_sha
    except Exception:
        pass
    import time
    return hex(int(time.time()))[2:9]


def archive_rule(rule_name: str):
    """Decommission and archive a specific detection rule."""
    yaral_path = RULES_DIR / f"{rule_name}.yaral"
    yaml_path = RULES_DIR / f"{rule_name}.yaml"

    if not yaral_path.exists():
        raise FileNotFoundError(f"YARA-L rule file not found: {yaral_path}")

    commit_sha = get_commit_sha()
    new_rule_name = f"{rule_name}_archived_{commit_sha}"

    ARCHIVED_DIR.mkdir(parents=True, exist_ok=True)
    new_yaral_path = ARCHIVED_DIR / f"{new_rule_name}.yaral"
    new_yaml_path = ARCHIVED_DIR / f"{new_rule_name}.yaml"

    # 1. Update YARA-L rule header in-place
    with open(yaral_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Match rule <name> and replace with rule <new_name>
    updated_content = re.sub(
        pattern=rf"rule\s+{re.escape(rule_name)}\b",
        repl=f"rule {new_rule_name}",
        string=content,
        count=1
    )

    with open(new_yaral_path, "w", encoding="utf-8") as f:
        f.write(updated_content)

    yaral_path.unlink()
    LOGGER.info("Moved and renamed YARA-L file: %s -> %s", yaral_path.name, new_yaral_path.name)

    # 2. Update and move YAML config
    config = {}
    if yaml_path.exists():
        try:
            with open(yaml_path, "r", encoding="utf-8") as f:
                loaded = yaml.safe_load(f)
                if isinstance(loaded, dict):
                    config = loaded
        except Exception as e:
            LOGGER.warning("Could not read YAML config: %s", e)
        yaml_path.unlink()

    config["enabled"] = False
    config["alerting"] = False
    config["run_frequency"] = str(config.get("run_frequency", "LIVE"))
    config["archived"] = True

    # Strip legacy sensitive IDs if present
    for sensitive_key in ["id", "resource_name", "create_time", "revision_create_time", "revision_id"]:
        config.pop(sensitive_key, None)

    with open(new_yaml_path, "w", encoding="utf-8") as f:
        yaml.dump(config, f, sort_keys=False)
    LOGGER.info("Moved and updated config file: %s -> %s", yaml_path.name, new_yaml_path.name)

    # 3. Append declarative moved blocks to terraform/moves.tf
    moved_block = f"""
moved {{
  from = module.chronicle_rules.google_chronicle_rule.rules["{rule_name}"]
  to   = module.chronicle_rules.google_chronicle_rule.rules["archived/{new_rule_name}"]
}}

moved {{
  from = module.chronicle_rules.google_chronicle_rule_deployment.deployments["{rule_name}"]
  to   = module.chronicle_rules.google_chronicle_rule_deployment.deployments["archived/{new_rule_name}"]
}}
"""
    with open(MOVES_FILE, "a", encoding="utf-8") as f:
        f.write(moved_block)

    LOGGER.info("Appended declarative moved blocks for '%s' to %s", rule_name, MOVES_FILE)
    LOGGER.info("Rule '%s' successfully archived. Commit the changes and run 'terraform plan'.", rule_name)


def main():
    parser = argparse.ArgumentParser(description="Archive a Chronicle detection rule with Terraform moved blocks.")
    parser.add_argument("--rule", required=True, help="Base name of the rule to archive (without .yaral extension)")
    args = parser.parse_args()

    archive_rule(args.rule)


if __name__ == "__main__":
    main()
