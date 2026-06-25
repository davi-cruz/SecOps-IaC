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
"""CLI tool to generate stats on YARA-L rule metadata tags."""

import argparse
from collections import Counter
import pathlib
import re
from typing import List


def extract_meta_keys(rule_text: str) -> List[str]:
  """Extracts all metadata keys from a YARA-L rule text."""
  # Find the meta section (only 'meta:')
  meta_match = re.search(
      r"^\s*meta:\s*(.*?)(?=^\s*(?:events|match|outcome|condition|options):|\})",
      rule_text,
      re.DOTALL | re.MULTILINE | re.IGNORECASE,
  )
  if not meta_match:
    return []

  meta_content = meta_match.group(1)
  # Find keys (words preceding '=')
  keys = re.findall(r"^\s*([a-zA-Z0-9_]+)\s*=", meta_content, re.MULTILINE)
  return [k.strip() for k in keys]


def generate_stats(rules_dir: pathlib.Path, include_archived: bool) -> Counter:
  """Scans YARA-L rules and counts occurrences of each metadata key."""
  stats = Counter()

  # Find all .yaral files
  rule_files = list(rules_dir.glob("*.yaral"))
  total_processed = len(rule_files)

  if include_archived:
    archived_dir = rules_dir / "archived"
    if archived_dir.exists():
      archived_files = list(archived_dir.glob("*.yaral"))
      rule_files.extend(archived_files)
      total_processed += len(archived_files)

  for rule_file in rule_files:
    try:
      with open(rule_file, "r", encoding="utf-8") as f:
        content = f.read()
        keys = extract_meta_keys(content)
        stats.update(keys)
    except Exception as e:  # pylint: disable="broad-exception-caught"
      print(f"Error reading {rule_file}: {e}")

  return stats, total_processed


def main():
  parser = argparse.ArgumentParser(
      description="Generate stats on YARA-L rule metadata."
  )
  parser.add_argument(
      "--rules-dir",
      type=pathlib.Path,
      default=pathlib.Path(__file__).parent.parent
      / "content"
      / "secops"
      / "rules",
      help=(
          "Directory containing YARA-L rules (default:"
          " content/secops/rules relative to script)"
      ),
  )
  parser.add_argument(
      "--include-archived",
      action="store_true",
      help="Include archived rules in the stats",
  )

  args = parser.parse_args()

  if not args.rules_dir.exists():
    print(f"Error: Rules directory '{args.rules_dir}' does not exist.")
    return

  stats, total_rules = generate_stats(args.rules_dir, args.include_archived)

  if not stats:
    print("No metadata keys found or no rules processed.")
    return

  # Print results
  print(f"\nMetadata Tag Statistics (Total rules processed: {total_rules})")
  print(f"{'-'*50}")
  print(f"{'Metadata Key':<30} | {'Rule Count':<10}")
  print(f"{'-'*50}")
  for key, count in stats.most_common():
    print(f"{key:<30} | {count:<10}")
  print(f"{'-'*50}\n")


if __name__ == "__main__":
  main()
