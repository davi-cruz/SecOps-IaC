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
#
"""Scratch script to automate finding and fixing missing 'technique' IDs in rules."""

import pathlib
import re

REPO_ROOT = pathlib.Path(__file__).parent.parent
RULES_DIR = REPO_ROOT / "content" / "secops" / "rules"


def extract_meta_value(rule_text: str, key: str) -> str | None:
    pattern = rf'^\s*{key}\s*=\s*["\']?([^"\'\n\r]+)["\']?'
    match = re.search(pattern, rule_text, re.MULTILINE | re.IGNORECASE)
    if match:
        return match.group(1).strip()
    return None


def derive_technique_from_url(url: str) -> str | None:
    """Extracts T-code from MITRE URL (e.g., T1078 or T1090/003/ -> T1090.003)."""
    # Matches /techniques/Txxxx/yyyy/ or /techniques/Txxxx/
    match = re.search(r"techniques/(T\d{4})(?:/(\d{3}))?", url)
    if match:
        t_code = match.group(1)
        sub_code = match.group(2)
        if sub_code:
            return f"{t_code}.{sub_code}"
        return t_code
    return None


def fix_rules():
    rule_files = list(RULES_DIR.glob("*.yaral")) + list((RULES_DIR / "archived").glob("*.yaral"))
    
    mitre_tags = [
        "mitre_attack_technique",
        "mitre_attack_tactic",
        "mitre_attack_url",
        "mitre_attack_version",
        "mitre_attack_analytic",
        "mitre_attack_detection_strategy",
        "mitre_attack_data_component"
    ]

    fixed_count = 0
    missing_but_no_url = 0

    for rule_file in rule_files:
        with open(rule_file, "r", encoding="utf-8") as f:
            content = f.read()

        has_mitre_tag = any(extract_meta_value(content, tag) is not None for tag in mitre_tags)
        
        if has_mitre_tag:
            technique = extract_meta_value(content, "technique")
            if not technique:
                url = extract_meta_value(content, "mitre_attack_url")
                if url:
                    derived = derive_technique_from_url(url)
                    if derived:
                        print(f"Fixing {rule_file.name}: Derived '{derived}' from URL '{url}'")
                        # Inject technique right after mitre_attack_url or mitre_attack_technique in the meta block
                        meta_match = re.search(
                            r"(mitre_attack_url\s*=\s*\"[^\"]+\")", 
                            content
                        )
                        if meta_match:
                            target = meta_match.group(1)
                            replacement = f'{target}\n    technique = "{derived}"'
                            content = content.replace(target, replacement, 1)
                        else:
                            # Fallback: inject before severity
                            severity_match = re.search(r"(severity\s*=)", content)
                            if severity_match:
                                target = severity_match.group(1)
                                replacement = f'technique = "{derived}"\n    {target}'
                                content = content.replace(target, replacement, 1)
                        
                        with open(rule_file, "w", encoding="utf-8") as f:
                            f.write(content)
                        fixed_count += 1
                    else:
                        print(f"Warning {rule_file.name}: Missing 'technique' and could not parse URL: '{url}'")
                        missing_but_no_url += 1
                else:
                    print(f"Warning {rule_file.name}: Missing 'technique' and has no 'mitre_attack_url'")
                    missing_but_no_url += 1

    print(f"\nScan finished.")
    print(f"Fixed rules: {fixed_count}")
    print(f"Rules missing technique but fixable: {missing_but_no_url}")


if __name__ == "__main__":
    fix_rules()
