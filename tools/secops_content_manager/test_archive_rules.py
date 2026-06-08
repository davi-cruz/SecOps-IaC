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
"""Tests for archive_rules.py."""

import pathlib
import shutil
import subprocess
from unittest import mock
import pytest
import ruamel.yaml

from tools.secops_content_manager import archive_rules


@pytest.fixture(name="temp_rules_env")
def temp_rules_env_fixture(tmp_path):
    """Fixture to set up a temporary rules directory structure."""
    rules_dir = tmp_path / "rules"
    rules_dir.mkdir()
    archived_dir = rules_dir / "archived"
    
    # Patch the global paths in archive_rules
    with mock.patch("tools.secops_content_manager.archive_rules.RULES_DIR", rules_dir), \
         mock.patch("tools.secops_content_manager.archive_rules.ARCHIVED_DIR", archived_dir):
        yield rules_dir, archived_dir


def test_get_commit_id_success():
    """Test retrieving commit SHA successfully."""
    with mock.patch("subprocess.check_output") as mock_check_output:
        mock_check_output.return_value = b"abc1234\n"
        assert archive_rules.get_commit_id() == "abc1234"
        mock_check_output.assert_called_once_with(["git", "rev-parse", "--short", "HEAD"], stderr=subprocess.DEVNULL)



def test_get_commit_id_failure():
    """Test retrieving commit SHA fallback when an error occurs."""
    with mock.patch("subprocess.check_output", side_effect=Exception("git error")):
        assert archive_rules.get_commit_id() == "unknown"


def test_cleanup_archive_creates_folder(temp_rules_env):
    """Test that cleanup_archive creates the archived directory if it doesn't exist."""
    _, archived_dir = temp_rules_env
    assert not archived_dir.exists()
    
    archive_rules.cleanup_archive()
    assert archived_dir.exists()


def test_cleanup_archive_retains_folder_contents(temp_rules_env):
    """Test that cleanup_archive preserves existing files and directories inside the archived folder."""
    _, archived_dir = temp_rules_env
    archived_dir.mkdir()
    
    # Create some files and directories to be preserved
    test_file = archived_dir / "test_file.txt"
    test_file.write_text("dummy", encoding="utf-8")
    
    sub_dir = archived_dir / "sub_dir"
    sub_dir.mkdir()
    sub_file = sub_dir / "sub_file.txt"
    sub_file.write_text("dummy2", encoding="utf-8")
    
    assert test_file.exists()
    assert sub_file.exists()
    
    archive_rules.cleanup_archive()
    
    assert archived_dir.exists()
    assert test_file.exists()
    assert sub_file.exists()



def test_pre_process_archived_rule(temp_rules_env):
    """Test renaming a newly archived rule with commit ID."""
    rules_dir, _ = temp_rules_env
    
    # Create an active rule to be archived
    rule_name = "test_rule"
    yaml_content = """\
enabled: false
alerting: false
archived: true
"""
    yaral_content = """\
rule test_rule {
  meta:
    author = "Author"
  condition:
    $e
}
"""
    yaml_path = rules_dir / f"{rule_name}.yaml"
    yaral_path = rules_dir / f"{rule_name}.yaral"
    
    yaml_path.write_text(yaml_content, encoding="utf-8")
    yaral_path.write_text(yaral_content, encoding="utf-8")
    
    with mock.patch("tools.secops_content_manager.archive_rules.get_commit_id", return_value="abc1234"):
        archive_rules.pre_process()
        
    # The rule should be renamed to test_rule_archived_abc1234
    expected_name = "test_rule_archived_abc1234"
    new_yaml_path = rules_dir / f"{expected_name}.yaml"
    new_yaral_path = rules_dir / f"{expected_name}.yaral"
    
    assert not yaml_path.exists()
    assert not yaral_path.exists()
    assert new_yaml_path.exists()
    assert new_yaral_path.exists()
    
    # Check that YARA-L rule header is also updated and starts with the comment
    updated_yaral = new_yaral_path.read_text(encoding="utf-8")
    assert updated_yaral.startswith(f"// original_name: {rule_name}\n")
    assert "rule test_rule_archived_abc1234 {" in updated_yaral

    # Check that YAML config starts with the comment
    updated_yaml = new_yaml_path.read_text(encoding="utf-8")
    assert updated_yaml.startswith(f"# original_name: {rule_name}\n")



def test_pre_process_skips_non_archived_rules(temp_rules_env):
    """Test that pre_process skips rules that are not fully archived (enabled=true)."""
    rules_dir, _ = temp_rules_env
    
    # Create an active rule (not archived)
    rule_name = "active_rule"
    yaml_content = """\
enabled: true
alerting: true
archived: false
"""
    yaral_content = """\
rule active_rule {
  meta:
    author = "Author"
}
"""
    yaml_path = rules_dir / f"{rule_name}.yaml"
    yaral_path = rules_dir / f"{rule_name}.yaral"
    
    yaml_path.write_text(yaml_content, encoding="utf-8")
    yaral_path.write_text(yaral_content, encoding="utf-8")
    
    with mock.patch("tools.secops_content_manager.archive_rules.get_commit_id", return_value="abc1234"):
        archive_rules.pre_process()
        
    # The files should NOT be renamed
    assert yaml_path.exists()
    assert yaral_path.exists()
    assert "rule active_rule {" in yaral_path.read_text(encoding="utf-8")


def test_post_process(temp_rules_env):
    """Test moving renamed archived files to the archived/ directory."""
    rules_dir, archived_dir = temp_rules_env
    archived_dir.mkdir()
    
    # Create a renamed archived rule and an active rule
    renamed_yaml = rules_dir / "rule_archived_abc1234.yaml"
    renamed_yaral = rules_dir / "rule_archived_abc1234.yaral"
    active_yaml = rules_dir / "active_rule.yaml"
    
    renamed_yaml.write_text("dummy", encoding="utf-8")
    renamed_yaral.write_text("dummy", encoding="utf-8")
    active_yaml.write_text("dummy", encoding="utf-8")
    
    archive_rules.post_process()
    
    # Renamed files should be moved to archived_dir
    assert not renamed_yaml.exists()
    assert not renamed_yaral.exists()
    assert (archived_dir / "rule_archived_abc1234.yaml").exists()
    assert (archived_dir / "rule_archived_abc1234.yaral").exists()
    
    # Active file should remain in rules_dir
    assert active_yaml.exists()
