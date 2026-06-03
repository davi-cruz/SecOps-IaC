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
"""Linter tests to enforce the Chronicle YARA-L Style Guide. 

This script serves as an example of how customers can validate YARA-L rules
against standard style guidelines in their own CI/CD pipelines.
"""

import pathlib
import re
import pytest

REPO_ROOT = pathlib.Path(__file__).parent.parent.parent.parent
RULES_DIR = REPO_ROOT / "content" / "secops" / "rules"

# Find all local YARA-L rule files to test
rule_files = list(RULES_DIR.glob("*.yaral"))

def extract_meta_value(rule_text: str, key: str) -> str | None:
    """Extract a metadata value from the YARA-L rule text using regex."""
    pattern = rf'^\s*{key}\s*=\s*["\']?([^"\'\n\r]+)["\']?'
    match = re.search(pattern, rule_text, re.MULTILINE | re.IGNORECASE)
    if match:
        return match.group(1).strip()
    return None

def get_outcome_section(rule_text: str) -> str | None:
    """Extract the content of the outcome section if it exists."""
    match = re.search(r'outcome:\s*(.*?)(?=\b(?:match|condition)\b|\})', rule_text, re.DOTALL | re.IGNORECASE)
    if match:
        return match.group(1)
    return None

@pytest.mark.parametrize("rule_file_path", rule_files, ids=lambda p: p.name)
def test_rule_style_guide(rule_file_path: pathlib.Path):
    """Verify that the YARA-L rule adheres to the style guide baseline standards."""
    with open(rule_file_path, "r", encoding="utf-8") as f:
        content = f.read()

    # ---------------------------------------------------------
    # 1. Formatting & Whitespace Checks
    # ---------------------------------------------------------
    
    # Ensure no tabs are used (style guide requirement)
    assert "\t" not in content, (
        f"Rule '{rule_file_path.name}' contains tab characters. "
        "Please use spaces for indentation."
    )
    
    # Ensure no trailing whitespaces
    for line_num, line in enumerate(content.splitlines(), start=1):
        assert not line.endswith(" ") and not line.endswith("\t"), (
            f"Rule '{rule_file_path.name}' contains trailing whitespace on line {line_num}."
        )

    # ---------------------------------------------------------
    # 2. Standard Meta Section Checks
    # ---------------------------------------------------------
    
    assert "meta:" in content, (
        f"Rule '{rule_file_path.name}' is missing a 'meta:' section."
    )

    # Verify required customer-safe meta: 'author'
    author = extract_meta_value(content, "author")
    assert author is not None, (
        f"Rule '{rule_file_path.name}' is missing the 'author' field in the meta section."
    )
    assert author != "", (
        f"Rule '{rule_file_path.name}' has an empty 'author' field."
    )

    # Verify required customer-safe meta: 'description'
    description = extract_meta_value(content, "description")
    assert description is not None, (
        f"Rule '{rule_file_path.name}' is missing the 'description' field in the meta section."
    )
    assert description != "", (
        f"Rule '{rule_file_path.name}' has an empty 'description' field."
    )

    # Verify required customer-safe meta: 'severity'
    severity = extract_meta_value(content, "severity")
    assert severity is not None, (
        f"Rule '{rule_file_path.name}' is missing the 'severity' field in the meta section."
    )
    valid_values = {"Info", "Low", "Medium", "High", "Critical"}
    assert severity.capitalize() in valid_values, (
        f"Rule '{rule_file_path.name}' has an invalid severity value '{severity}'. "
        f"Must be one of {valid_values}."
    )

    # Verify optional/recommended customer-safe meta: 'priority'
    priority = extract_meta_value(content, "priority")
    if priority is not None:
        assert priority.capitalize() in valid_values, (
            f"Rule '{rule_file_path.name}' has an invalid priority value '{priority}'. "
            f"Must be one of {valid_values}."
        )

    # ---------------------------------------------------------
    # 3. Outcome Section Checks
    # ---------------------------------------------------------
    outcome_section = get_outcome_section(content)
    if outcome_section:
        # Check for standard singular naming conventions for outcome variables
        outcome_vars = re.findall(r'\$([a-zA-Z0-9_]+)\s*=', outcome_section)
        
        invalid_plural_vars = {"vendor_names", "product_names"}
        for var in outcome_vars:
            assert var not in invalid_plural_vars, (
                f"Rule '{rule_file_path.name}' uses invalid plural outcome variable '${var}'. "
                "Outcome variables must be singular (e.g., use '$vendor_name' instead of '$vendor_names')."
            )

        # Verify risk score constraints (minimum floor is 5, not 0)
        risk_score_match = re.search(
            r'\$risk_score\s*=\s*(?:max\s*\(\s*(\d+)\s*\)|(\d+))', 
            outcome_section, 
            re.IGNORECASE
        )
        if risk_score_match:
            score_val_str = risk_score_match.group(1) or risk_score_match.group(2)
            score_val = int(score_val_str)
            assert score_val >= 5, (
                f"Rule '{rule_file_path.name}' has a $risk_score of {score_val}. "
                "The style guide mandates that the minimum floor for $risk_score is 5 (cannot be 0)."
            )
