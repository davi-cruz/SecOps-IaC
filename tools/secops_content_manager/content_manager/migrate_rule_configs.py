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
#
"""Migrate rule config from monolithic YAML to individual YAML files."""

import pathlib
import yaml

REPO_ROOT = pathlib.Path(__file__).parent.parent.parent.parent
SEC_OPS_DIR = REPO_ROOT / "content" / "secops"
CONFIG_DIR = SEC_OPS_DIR / "config"
RULES_DIR = SEC_OPS_DIR / "rules"
RULE_CONFIG_FILE = CONFIG_DIR / "rule_config.yaml"


def migrate():
  """Split monolithic config into individual rule YAML files."""
  if not RULE_CONFIG_FILE.exists():
    print(f"Monolithic rule config file not found: {RULE_CONFIG_FILE}")
    print("Migration has already been executed or config file is missing.")
    return

  print(f"Loading monolithic rule config from {RULE_CONFIG_FILE}...")
  with open(RULE_CONFIG_FILE, "r", encoding="utf-8") as f:
    rule_configs = yaml.safe_load(f)

  if not rule_configs:
    print("Rule config file is empty or invalid.")
    return

  print(f"Migrating configurations for {len(rule_configs)} rules...")
  migrated_count = 0
  for rule_name, rule_config in rule_configs.items():
    # Make sure we only migrate if a corresponding .yaral file exists on disk
    yaral_file = RULES_DIR / f"{rule_name}.yaral"
    if not yaral_file.exists():
      print(f"Warning: .yaral file not found for rule '{rule_name}'. Skipping.")
      continue

    yaml_file = RULES_DIR / f"{rule_name}.yaml"
    with open(yaml_file, "w", encoding="utf-8") as f:
      yaml.dump(rule_config, f, default_flow_style=False, sort_keys=True)
    migrated_count += 1

  print(f"Successfully migrated {migrated_count} rule configurations.")

  # Delete the monolithic file
  RULE_CONFIG_FILE.unlink()
  print(f"Deleted monolithic config file: {RULE_CONFIG_FILE}")


if __name__ == "__main__":
  migrate()
