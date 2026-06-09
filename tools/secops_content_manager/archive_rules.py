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
"""Helper script to automate Google SecOps rule archiving lifecycle.

This script automates:
1. Appending the short Git commit ID to the archived rule name before deployment.
2. Moving the renamed and archived rule files into cold-storage ('archived/').
3. Cleaning up any previous contents in the 'archived/' folder.
"""

import argparse
import logging
import pathlib
import re
import shutil
import subprocess
import ruamel.yaml

logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")
LOGGER = logging.getLogger("archive_rules")

RULES_DIR = pathlib.Path("content/secops/rules")
ARCHIVED_DIR = RULES_DIR / "archived"


def get_commit_id() -> str:
    """Retrieve the current short Git commit SHA."""
    try:
        commit_sha = subprocess.check_output(
            ["git", "rev-parse", "--short", "HEAD"],
            stderr=subprocess.DEVNULL
        ).decode("utf-8").strip()
        return commit_sha
    except Exception as e:
        LOGGER.warning("Could not retrieve Git commit ID, falling back to 'unknown'. Error: %s", e)
        return "unknown"


def cleanup_archive():
    """Ensure the archived folder exists, retaining its historical contents."""
    if not ARCHIVED_DIR.exists():
        LOGGER.info("Creating Archive folder: %s", ARCHIVED_DIR)
        ARCHIVED_DIR.mkdir(parents=True, exist_ok=True)
    else:
        LOGGER.info("Archive folder %s already exists. Preserving historical archived rules.", ARCHIVED_DIR)



def pre_process():
    """Find local rules set to archived=true, and rename them with the Git commit ID."""
    if not RULES_DIR.exists():
        LOGGER.warning("Rules directory %s does not exist. Skipping pre-process.", RULES_DIR)
        return

    commit_id = get_commit_id()
    yaml_parser = ruamel.yaml.YAML()
    yaml_parser.preserve_quotes = True

    # Scan for any .yaml config files in the active rules directory
    for yaml_path in list(RULES_DIR.glob("*.yaml")):
        if yaml_path.parent == ARCHIVED_DIR:
            continue

        try:
            with open(yaml_path, "r", encoding="utf-8") as f:
                config_data = yaml_parser.load(f)

            if not config_data:
                continue

            # Check if this rule is set to archived=true, enabled=false, alerting=false
            is_archived = config_data.get("archived") is True
            is_disabled = config_data.get("enabled") is False
            is_alert_off = config_data.get("alerting") is False

            if is_archived and is_disabled and is_alert_off:
                rule_name = yaml_path.stem

                # Skip if already renamed with _archived_
                if "_archived_" in rule_name:
                    continue

                new_name = f"{rule_name}_archived_{commit_id}"
                LOGGER.info("Detected newly archived rule '%s'. Renaming to '%s'", rule_name, new_name)

                # 1. Rename and update .yaral rule file header name
                yaral_path = RULES_DIR / f"{rule_name}.yaral"
                new_yaral_path = RULES_DIR / f"{new_name}.yaral"

                if yaral_path.is_file():
                    with open(yaral_path, "r", encoding="utf-8") as f:
                        yaral_text = f.read()

                    # Prepend a comment with the original rule name
                    yaral_comment = f"// original_name: {rule_name}\n"
                    if not yaral_text.startswith(yaral_comment):
                        yaral_text = yaral_comment + yaral_text

                    # Safely replace rule header (e.g. rule rule_name_xyz { -> rule rule_name_xyz_archived_sha {)
                    pattern = re.compile(rf"\brule\s+{re.escape(rule_name)}\b")
                    if pattern.search(yaral_text):
                        new_yaral_text = pattern.sub(f"rule {new_name}", yaral_text, count=1)
                        
                        # Apply standard linter formatting / sanitization automatically
                        from tools.secops_content_manager.content_manager.rules import Rules
                        new_yaral_text = Rules.sanitize_rule_text(new_yaral_text)
                        
                        with open(yaral_path, "w", encoding="utf-8") as f:
                            f.write(new_yaral_text)
                    else:
                        LOGGER.warning("Could not find rule header 'rule %s' in %s", rule_name, yaral_path)

                    yaral_path.rename(new_yaral_path)
                else:
                    LOGGER.warning("YARA-L file not found for rule %s", rule_name)

                # 2. Add comment to the .yaml config file and rename it
                with open(yaml_path, "r", encoding="utf-8") as f:
                    yaml_text = f.read()

                yaml_comment = f"# original_name: {rule_name}\n"
                if not yaml_text.startswith(yaml_comment):
                    yaml_text = yaml_comment + yaml_text

                with open(yaml_path, "w", encoding="utf-8") as f:
                    f.write(yaml_text)

                new_yaml_path = RULES_DIR / f"{new_name}.yaml"
                yaml_path.rename(new_yaml_path)


        except Exception as e:
            LOGGER.error("Failed to pre-process archived rule %s: %s", yaml_path.name, e)


def post_process():
    """Find any renamed archived rule files (*_archived_*.yaral/.yaml) and move them to cold-storage."""
    if not RULES_DIR.exists():
        return

    ARCHIVED_DIR.mkdir(parents=True, exist_ok=True)

    # Scan for any .yaral or .yaml files matching the archived pattern in the active rules folder
    for path in list(RULES_DIR.glob("*")):
        if path.is_file() and "_archived_" in path.name:
            target_path = ARCHIVED_DIR / path.name
            LOGGER.info("Moving archived rule file '%s' -> '%s'", path.name, target_path)
            shutil.move(str(path), str(target_path))


def main():
    parser = argparse.ArgumentParser(description="Google SecOps Rule Archiving Automation")
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--cleanup", action="store_true", help="Clean up the Archive directory")
    group.add_argument("--pre", action="store_true", help="Rename newly archived rules with Git commit ID")
    group.add_argument("--post", action="store_true", help="Move renamed archived rules to the cold-storage Archive directory")

    args = parser.parse_args()

    if args.cleanup:
        cleanup_archive()
    elif args.pre:
        pre_process()
    elif args.post:
        post_process()


if __name__ == "__main__":
    main()
