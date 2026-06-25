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
import yaml

REPO_ROOT = pathlib.Path(__file__).parent.parent.parent.parent
RULES_DIR = REPO_ROOT / "content" / "secops" / "rules"
STYLE_CONFIG_FILE = REPO_ROOT / "content" / "secops" / "config" / "style_config.yaml"

DEFAULT_STYLE_CONFIG = {
    "required_metadata": [
        {"field": "author", "required": True, "non_empty": True},
        {"field": "description", "required": True, "non_empty": True},
        {
            "field": "severity",
            "required": True,
            "allowed_values": ["Info", "Low", "Medium", "High", "Critical"],
        },
        {
            "field": "priority",
            "required": False,
            "allowed_values": ["Info", "Low", "Medium", "High", "Critical"],
        },
    ]
}

def load_style_config():
    if STYLE_CONFIG_FILE.exists():
        try:
            with open(STYLE_CONFIG_FILE, "r", encoding="utf-8") as f:
                return yaml.safe_load(f)
        except Exception:
            pass
    return DEFAULT_STYLE_CONFIG

style_config = load_style_config()

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


def find_unterminated_literals(text: str) -> list[tuple[int, str]]:
    """Scans text for unterminated string or regex literals."""
    state = "NORMAL"
    lines = text.splitlines()
    errors = []
    start_line = 0
    
    for line_num, line in enumerate(lines, start=1):
        i = 0
        while i < len(line):
            char = line[i]
            next_char = line[i+1] if i + 1 < len(line) else ""
            
            if state == "NORMAL":
                if char == '"':
                    state = "IN_STRING"
                    start_line = line_num
                elif char == '`':
                    state = "IN_BACKTICK"
                    start_line = line_num
                elif char == '/' and next_char == '/':
                    break
                elif char == '/' and next_char == '*':
                    state = "IN_BLOCK_COMMENT"
                    start_line = line_num
                    i += 1
            elif state == "IN_STRING":
                if char == '\\':
                    i += 1
                elif char == '"':
                    state = "NORMAL"
            elif state == "IN_BACKTICK":
                if char == '\\':
                    i += 1
                elif char == '`':
                    state = "NORMAL"
            elif state == "IN_BLOCK_COMMENT":
                if char == '*' and next_char == '/':
                    state = "NORMAL"
                    i += 1
            i += 1
            
        if state == "IN_STRING":
            errors.append((line_num, "Unterminated double-quoted string"))
            state = "NORMAL"
        elif state == "IN_BACKTICK":
            errors.append((line_num, "Unterminated backtick string"))
            state = "NORMAL"
            
    if state == "IN_BLOCK_COMMENT":
        errors.append((start_line, "Unterminated block comment starting here"))
        
    return errors


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
        """Ensure the rule has a defined standard 'meta:' block."""
        assert re.search(r'^\s*meta:\s*', rule_content, re.MULTILINE), (
            f"[{rule_content.relative_path}] Rule is missing the standard 'meta:' section."
        )

    def test_no_internal_or_customer_meta(self, rule_content):
        """Ensure the rule does not contain internal_meta or customer_meta blocks."""
        assert "internal_meta:" not in rule_content, (
            f"[{rule_content.relative_path}] Rule contains internal-only 'internal_meta:' block."
        )
        assert "customer_meta:" not in rule_content, (
            f"[{rule_content.relative_path}] Rule contains internal-only 'customer_meta:' block."
        )

    @pytest.mark.parametrize(
        "metadata_rule",
        style_config.get("required_metadata", []),
        ids=lambda r: f"meta_{r['field']}"
    )
    def test_metadata_fields(self, rule_content, metadata_rule):
        """Verify metadata fields based on configuration."""
        field_name = metadata_rule["field"]
        required = metadata_rule.get("required", True)
        non_empty = metadata_rule.get("non_empty", False)
        allowed_values = metadata_rule.get("allowed_values", None)
        regex_pattern = metadata_rule.get("regex", None)

        assert "meta:" in rule_content, f"[{rule_content.relative_path}] Missing 'meta:' section."

        value = extract_meta_value(rule_content, field_name)

        if required:
            assert value is not None, f"[{rule_content.relative_path}] Field '{field_name}' is missing in the meta section."

        if value is not None:
            if non_empty:
                assert value != "", f"[{rule_content.relative_path}] Field '{field_name}' is defined but empty."
            if allowed_values:
                allowed_values_lower = [v.lower() for v in allowed_values]
                assert value.lower() in allowed_values_lower, (
                    f"[{rule_content.relative_path}] Invalid value '{value}' for field '{field_name}'. "
                    f"Must be one of {allowed_values}."
                )
            if regex_pattern:
                assert re.match(regex_pattern, value), (
                    f"[{rule_content.relative_path}] Field '{field_name}' value '{value}' "
                    f"does not match required format/pattern: '{regex_pattern}'"
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

    def test_no_unterminated_literals(self, rule_content):
        """Ensure there are no unterminated string or comment literals."""
        errors = find_unterminated_literals(rule_content)
        if errors:
            error_msgs = [f"Line {line}: {msg}" for line, msg in errors]
            assert False, (
                f"[{rule_content.relative_path}] Found unterminated literals:\n"
                + "\n".join(error_msgs)
            )

