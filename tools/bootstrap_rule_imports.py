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
"""Bootstrap script to generate Terraform 1.5+ import blocks for existing rules and sanitize rule configs.

Usage:
    # 1. Generate terraform/rule_imports.tf from existing YAML rule metadata:
    python tools/bootstrap_rule_imports.py --generate

    # 2. After verifying 'terraform plan', sanitize all YAML files to scrub sensitive IDs:
    python tools/bootstrap_rule_imports.py --sanitize
"""

import argparse
import logging
import pathlib
import yaml

logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")
LOGGER = logging.getLogger("bootstrap_rule_imports")

REPO_ROOT = pathlib.Path(__file__).parent.parent
RULES_DIR = REPO_ROOT / "content" / "secops" / "rules"
OUTPUT_IMPORTS_FILE = REPO_ROOT / "terraform" / "rule_imports.tf"


def generate_import_blocks():
    """Scan all rule YAML files and generate terraform/rule_imports.tf."""
    import_blocks = [
        "# Auto-generated declarative import blocks for existing Chronicle rules (Terraform 1.5+)\n",
        "# Generated from existing rule metadata to bind existing remote rules into GCS state.\n",
        "# Run 'terraform plan' to verify that all rules are imported cleanly (no destroys/creates).\n\n"
    ]

    total_rules = 0
    active_yaml_files = sorted(list(RULES_DIR.glob("*.yaml")))
    archived_yaml_files = sorted(list((RULES_DIR / "archived").glob("*.yaml"))) if (RULES_DIR / "archived").exists() else []

    all_files = [("active", p) for p in active_yaml_files] + [("archived", p) for p in archived_yaml_files]

    for category, yaml_path in all_files:
        rule_name = yaml_path.stem
        try:
            with open(yaml_path, "r", encoding="utf-8") as f:
                data = yaml.safe_load(f)
        except Exception as e:
            LOGGER.error("Error reading %s: %s", yaml_path, e)
            continue

        if not data or not isinstance(data, dict):
            continue

        rule_id = data.get("id")
        if not rule_id:
            LOGGER.warning("Rule '%s' has no 'id' field in %s. Skipping import block.", rule_name, yaml_path)
            continue

        resource_key = f"archived/{rule_name}" if category == "archived" else rule_name
        import_blocks.append(f"""import {{
  to = module.chronicle_rules.google_chronicle_rule.rules["{resource_key}"]
  id = "projects/${{var.project_id}}/locations/${{var.chronicle_location}}/instances/${{var.chronicle_instance_id}}/rules/{rule_id}"
}}

import {{
  to = module.chronicle_rules.google_chronicle_rule_deployment.deployments["{resource_key}"]
  id = "projects/${{var.project_id}}/locations/${{var.chronicle_location}}/instances/${{var.chronicle_instance_id}}/rules/{rule_id}/deployment"
}}
""")
        total_rules += 1

    with open(OUTPUT_IMPORTS_FILE, "w", encoding="utf-8") as f:
        f.writelines(import_blocks)

    LOGGER.info("Successfully generated %d rule import blocks in %s", total_rules, OUTPUT_IMPORTS_FILE)


def sanitize_yaml_files():
    """Scrub sensitive IDs, project numbers, and API metadata from all rule YAML files."""
    sanitized_count = 0
    all_yaml_files = list(RULES_DIR.rglob("*.yaml"))

    for yaml_path in all_yaml_files:
        try:
            with open(yaml_path, "r", encoding="utf-8") as f:
                data = yaml.safe_load(f)
        except Exception as e:
            LOGGER.error("Error loading %s: %s", yaml_path, e)
            continue

        if not data or not isinstance(data, dict):
            continue

        clean_data = {
            "enabled": bool(data.get("enabled", False)),
            "alerting": bool(data.get("alerting", False)),
            "run_frequency": str(data.get("run_frequency", "LIVE")),
            "archived": bool(data.get("archived", False)),
        }

        with open(yaml_path, "w", encoding="utf-8") as f:
            yaml.dump(clean_data, f, sort_keys=False)

        sanitized_count += 1

    LOGGER.info("Successfully sanitized %d rule YAML files across %s", sanitized_count, RULES_DIR)


def main():
    parser = argparse.ArgumentParser(description="Bootstrap Terraform rule imports and sanitize rule configs.")
    parser.add_argument("--generate", action="store_true", help="Generate terraform/rule_imports.tf from YAML files")
    parser.add_argument("--sanitize", action="store_true", help="Scrub sensitive IDs from all rule YAML files")
    args = parser.parse_args()

    if args.generate:
        generate_import_blocks()
    elif args.sanitize:
        sanitize_yaml_files()
    else:
        parser.print_help()


if __name__ == "__main__":
    main()
