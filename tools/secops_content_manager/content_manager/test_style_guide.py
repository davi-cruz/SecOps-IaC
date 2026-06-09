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

This file is structured to provide highly granular test results in IDEs like VS Code.
"""

import pathlib
import re
import pytest

REPO_ROOT = pathlib.Path(__file__).parent.parent.parent.parent
RULES_DIR = REPO_ROOT / "content" / "secops" / "rules"

# Find all local YARA-L rule files to test, including archived rules
rule_files = list(RULES_DIR.glob("*.yaral")) + list((RULES_DIR / "archived").glob("*.yaral"))



class RuleContent(str):
    """Custom string sub-class that preserves the original file path metadata."""

    def __new__(cls, content, path):
        obj = super().__new__(cls, content)
        obj.path = path
        return obj

    @property
    def relative_path(self) -> str:
        """Return the path relative to the repository root."""
        try:
            return str(self.path.relative_to(REPO_ROOT))
        except Exception:
            return str(self.path)


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


@pytest.fixture(name="rule_content", scope="class")
def rule_content_fixture(request) -> RuleContent:
    """Fixture to read the file content once per rule parameterized run."""
    file_path = request.param
    with open(file_path, "r", encoding="utf-8") as f:
        return RuleContent(f.read(), file_path)


def _get_relative_path_id(p: pathlib.Path) -> str:
    """Return the relative path of a rule file to make test failures easier to find."""
    try:
        return str(p.relative_to(REPO_ROOT))
    except ValueError:
        return p.name


# Parameterize at the class level so every test method runs for every rule file
@pytest.mark.parametrize("rule_content", rule_files, indirect=True, ids=_get_relative_path_id)
class TestRuleStyle:
    """Style guide test cases for YARA-L rules."""

    def test_no_tabs(self, rule_content):
        """Ensure no tab characters are used (use spaces for indentation)."""
        assert "\t" not in rule_content, (
            f"[{rule_content.relative_path}] Rule contains tab characters. Please replace all tabs with spaces."
        )

    def test_no_trailing_whitespace(self, rule_content):
        """Ensure no lines contain trailing whitespace."""
        for line_num, line in enumerate(rule_content.splitlines(), start=1):
            assert not line.endswith(" ") and not line.endswith("\t"), (
                f"[{rule_content.relative_path}] Line {line_num} contains trailing whitespace."
            )

    def test_has_meta_section(self, rule_content):
        """Ensure the rule has a defined 'meta:' block."""
        assert "meta:" in rule_content, (
            f"[{rule_content.relative_path}] Rule is missing the 'meta:' section."
        )

    def test_has_author(self, rule_content):
        """Ensure the 'author' field is defined in meta and is not empty."""
        assert "meta:" in rule_content, f"[{rule_content.relative_path}] Skipping: Missing meta block."
        author = extract_meta_value(rule_content, "author")
        assert author is not None, f"[{rule_content.relative_path}] Field 'author' is missing in the meta section."
        assert author != "", f"[{rule_content.relative_path}] Field 'author' is defined but empty."

    def test_has_description(self, rule_content):
        """Ensure the 'description' field is defined in meta and is not empty."""
        assert "meta:" in rule_content, f"[{rule_content.relative_path}] Skipping: Missing meta block."
        description = extract_meta_value(rule_content, "description")
        assert description is not None, f"[{rule_content.relative_path}] Field 'description' is missing in the meta section."
        assert description != "", f"[{rule_content.relative_path}] Field 'description' is defined but empty."

    def test_has_valid_severity(self, rule_content):
        """Ensure 'severity' is defined and has a standard value."""
        assert "meta:" in rule_content, f"[{rule_content.relative_path}] Skipping: Missing meta block."
        severity = extract_meta_value(rule_content, "severity")
        assert severity is not None, f"[{rule_content.relative_path}] Field 'severity' is missing in the meta section."
        valid_values = {"Info", "Low", "Medium", "High", "Critical"}
        assert severity.capitalize() in valid_values, (
            f"[{rule_content.relative_path}] Invalid severity value '{severity}'. Must be one of {valid_values}."
        )

    def test_has_valid_priority(self, rule_content):
        """Ensure that if 'priority' is defined, it contains a valid value."""
        assert "meta:" in rule_content, f"[{rule_content.relative_path}] Skipping: Missing meta block."
        priority = extract_meta_value(rule_content, "priority")
        if priority is not None:
            valid_values = {"Info", "Low", "Medium", "High", "Critical"}
            assert priority.capitalize() in valid_values, (
                f"[{rule_content.relative_path}] Invalid priority value '{priority}'. Must be one of {valid_values}."
            )

    def test_singular_outcome_variables(self, rule_content):
        """Ensure outcome variables use standard singular naming (e.g. $vendor_name)."""
        outcome_section = get_outcome_section(rule_content)
        if outcome_section:
            outcome_vars = re.findall(r'\$([a-zA-Z0-9_]+)\s*=', outcome_section)
            invalid_plural_vars = {"vendor_names", "product_names"}
            for var in outcome_vars:
                assert var not in invalid_plural_vars, (
                    f"[{rule_content.relative_path}] Uses invalid plural outcome variable '${var}'. "
                    "Must be singular (e.g., use '$vendor_name' instead of '$vendor_names')."
                )

    def test_risk_score_floor(self, rule_content):
        """Ensure the minimum floor for $risk_score is 5 (cannot be 0)."""
        outcome_section = get_outcome_section(rule_content)
        if outcome_section:
            risk_score_match = re.search(
                r'\$risk_score\s*=\s*(?:max\s*\(\s*(\d+)\s*\)|(\d+))',
                outcome_section,
                re.IGNORECASE
            )
            if risk_score_match:
                score_val_str = risk_score_match.group(1) or risk_score_match.group(2)
                score_val = int(score_val_str)
                assert score_val >= 5, (
                    f"[{rule_content.relative_path}] Invalid $risk_score value ({score_val}). "
                    "The style guide mandates a minimum floor of 5 (cannot be 0)."
                )

