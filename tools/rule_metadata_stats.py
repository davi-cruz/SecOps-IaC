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
"""CLI tool to generate stats and inspect quality of YARA-L rule metadata."""

import argparse
from collections import Counter, defaultdict
import pathlib
import re
from typing import Dict, List, Tuple

# Metadata tags that are always classified as Free Text by convention
FREE_TEXT_CONVENTION = {
    "author",
    "description",
    "assumption",
    "reference",
    "mitre_attack_url",
    "playbook",
    "display_name",
    "false_positives",
    "mitre_attack_technique",
    "mitre_attack_tactic",
    "data_source",
    "mitre_attack_analytic",
    "mitre_attack_detection_strategy",
    "mitre_attack_data_component",
    "d3fend_technique",
    "namespace",
}

# Tags where duplicate values indicate potential copy-paste quality issues
SUSPICIOUS_DUPLICATE_TAGS = {
    "description",
    "assumption",
    "display_name",
    "playbook",
}

# Tags that contain comma-separated values (CSVs) which should be split for analysis
MULTIVALUE_TAGS = {
    "data_source",
    "tags",
    "technique",
    "tactic",
    "mitre_attack_tactic",
    "mitre_attack_technique",
    "mitre_attack_analytic",
    "mitre_attack_detection_strategy",
    "mitre_attack_data_component",
    "d3fend_technique",
}



def extract_meta_pairs(rule_text: str) -> Dict[str, str]:
    """Extracts all metadata key-value pairs from a YARA-L rule text."""
    meta_match = re.search(
        r"^\s*meta:\s*(.*?)(?=^\s*(?:events|match|outcome|condition|options):|\})",
        rule_text,
        re.DOTALL | re.MULTILINE | re.IGNORECASE,
    )
    if not meta_match:
        return {}

    meta_content = meta_match.group(1)
    # Find key-value pairs
    pairs = re.findall(r'^\s*([a-zA-Z0-9_]+)\s*=\s*["\']([^"\']*)["\']', meta_content, re.MULTILINE)
    return {k.strip(): v.strip() for k, v in pairs}


def collect_metadata(
    rules_dir: pathlib.Path, include_archived: bool, filter_type: str = None
) -> Tuple[List[Dict[str, str]], int, int]:
    """Scans YARA-L rules and collects metadata dict for each."""
    rule_files = list(rules_dir.glob("*.yaral"))
    total_files = len(rule_files)

    if include_archived:
        archived_dir = rules_dir / "archived"
        if archived_dir.exists():
            archived_files = list(archived_dir.glob("*.yaral"))
            rule_files.extend(archived_files)
            total_files += len(archived_files)

    rules_metadata = []
    total_processed = 0

    for rule_file in rule_files:
        try:
            with open(rule_file, "r", encoding="utf-8") as f:
                content = f.read()
            
            meta = extract_meta_pairs(content)
            if not meta:
                continue
                
            # Apply filter by rule type if specified
            if filter_type:
                rule_type = meta.get("type", "").lower()
                if rule_type != filter_type.lower():
                    continue
                    
            total_processed += 1
            meta["__filename__"] = rule_file.name
            rules_metadata.append(meta)
        except Exception as e:  # pylint: disable="broad-exception-caught"
            print(f"Error reading {rule_file}: {e}")

    return rules_metadata, total_processed, total_files


def print_general_stats(metadata_list: List[Dict[str, str]], total_processed: int, sort_option: str):
    """Prints general count stats of metadata keys."""
    stats = Counter()
    for meta in metadata_list:
        stats.update([k for k in meta.keys() if k != "__filename__"])

    items = list(stats.items())
    if sort_option == "count-desc":
        items.sort(key=lambda x: (-x[1], x[0]))
    elif sort_option == "count-asc":
        items.sort(key=lambda x: (x[1], x[0]))
    elif sort_option == "key-asc":
        items.sort(key=lambda x: x[0])
    elif sort_option == "key-desc":
        items.sort(key=lambda x: x[0], reverse=True)

    print(f"\nMetadata Tag Statistics (Rules matched filter: {total_processed})")
    print(f"{'-'*50}")
    print(f"{'Metadata Key':<30} | {'Rule Count':<10}")
    print(f"{'-'*50}")
    for key, count in items:
        print(f"{key:<30} | {count:<10}")
    print(f"{'-'*50}\n")


def analyze_tag(metadata_list: List[Dict[str, str]], tag_name: str, group_by: str = None):
    """Analyzes a specific tag's values and prints stats."""
    values = []
    grouped_values = defaultdict(list)
    total_rules_with_tag = 0
    
    for meta in metadata_list:
        if tag_name in meta:
            total_rules_with_tag += 1
            val = meta[tag_name]
            
            # Handle CSV split if tag is multivalue
            if tag_name in MULTIVALUE_TAGS:
                sub_vals = [v.strip() for v in val.split(",") if v.strip()]
            else:
                sub_vals = [val]
                
            values.extend(sub_vals)
            
            if group_by:
                g_val = meta.get(group_by, "Unknown")
                grouped_values[g_val].extend(sub_vals)

    if total_rules_with_tag == 0:
        print(f"\nTag '{tag_name}' is not present in any processed rules.")
        return

    unique_vals = set(values)
    print(f"\nAnalysis for Tag: '{tag_name}'" + (" (CSV Split enabled)" if tag_name in MULTIVALUE_TAGS else ""))
    print(f"{'='*65}")
    print(f"Total rules with this tag:          {total_rules_with_tag}")
    print(f"Total individual values aggregated: {len(values)}")
    print(f"Unique values:                      {len(unique_vals)}")
    print(f"{'='*65}")

    if not group_by:
        counter = Counter(values)
        print(f"{'Value':<45} | {'Rules Count':<11} | {'% of Rules':<10}")
        print(f"{'-'*74}")
        for val, count in counter.most_common(50):
            pct = (count / total_rules_with_tag) * 100
            truncated_val = val[:45] if len(val) <= 45 else val[:42] + "..."
            print(f"{truncated_val:<45} | {count:<11} | {pct:>9.1f}%")
        if len(counter) > 50:
            print(f"... and {len(counter) - 50} more unique values.")
    else:
        # Group by handling (group totals are number of rules in that group having this tag)
        group_rule_totals = defaultdict(int)
        for meta in metadata_list:
            if tag_name in meta:
                g_val = meta.get(group_by, "Unknown")
                group_rule_totals[g_val] += 1
                
        print(f"Grouped by: {group_by}")
        for group, g_vals in sorted(grouped_values.items()):
            g_total_rules = group_rule_totals[group]
            g_counter = Counter(g_vals)
            print(f"\n  Group: '{group}' (Rules with tag: {g_total_rules}, total values: {len(g_vals)})")
            print(f"  {'-'*64}")
            for val, count in g_counter.most_common(10):
                pct = (count / g_total_rules) * 100
                truncated_val = val[:35] if len(val) <= 35 else val[:32] + "..."
                print(f"    {truncated_val:<35} | {count:<11} | {pct:>9.1f}%")
            if len(g_counter) > 10:
                print(f"    ... and {len(g_counter) - 10} more unique values")


def generate_quality_report(metadata_list: List[Dict[str, str]], total_rules: int):
    """Generates a comprehensive metadata quality report."""
    tag_values = defaultdict(list)
    tag_file_map = defaultdict(lambda: defaultdict(list))
    tag_rule_counts = defaultdict(int)
    
    for meta in metadata_list:
        filename = meta.get("__filename__", "Unknown")
        for k, v in meta.items():
            if k == "__filename__":
                continue
            tag_rule_counts[k] += 1
            
            # Split multivalue tags
            if k in MULTIVALUE_TAGS:
                sub_vals = [sub.strip() for sub in v.split(",") if sub.strip()]
            else:
                sub_vals = [v]
                
            tag_values[k].extend(sub_vals)
            for sub in sub_vals:
                tag_file_map[k][sub].append(filename)

    print(f"\nMetadata Quality & Classification Report (Rules Analyzed: {total_rules})")
    print(f"{'='*90}")
    print(f"{'Tag':<25} | {'Coverage':<8} | {'Unique Vals':<11} | {'Classification':<15} | {'Multivalue (CSV)'}")
    print(f"{'='*90}")

    enum_tags = []
    text_tags = []

    for tag, vals in sorted(tag_values.items()):
        rule_count = tag_rule_counts[tag]
        coverage_pct = (rule_count / total_rules) * 100
        unique_count = len(set(vals))
        is_multivalue = "Yes" if tag in MULTIVALUE_TAGS else "No"
        
        # Classification logic:
        # 1. Check if it's Free Text by convention
        if tag in FREE_TEXT_CONVENTION:
            classification = "Free Text"
            text_tags.append((tag, vals, tag_file_map[tag]))
        else:
            # 2. Check value length constraint (max length of individual values <= 15)
            # 3. Check uniqueness ratio (on unique count relative to number of rules having the tag)
            max_val_len = max(len(str(v)) for v in vals) if vals else 0
            uniqueness_ratio = unique_count / rule_count if rule_count > 0 else 0
            
            if max_val_len <= 15 and (unique_count <= 10 or (uniqueness_ratio < 0.2 and unique_count < 25)):
                classification = "Enum/Category"
                enum_tags.append((tag, vals))
            else:
                classification = "Free Text"
                text_tags.append((tag, vals, tag_file_map[tag]))
            
        print(f"{tag:<25} | {coverage_pct:>7.1f}% | {unique_count:<11} | {classification:<15} | {is_multivalue}")

    print(f"{'='*90}")

    # 1. Print Author Stats
    authors_vals = tag_values.get("author", [])
    if authors_vals:
        print(f"\nAuthor Rules Distribution Summary:")
        print(f"{'='*90}")
        authors_counter = Counter(authors_vals)
        print(f"{'Author':<50} | {'Rules Created':<15} | {'%':<5}")
        print(f"{'-'*76}")
        for author, count in authors_counter.most_common():
            pct = (count / len(authors_vals)) * 100
            print(f"{author:<50} | {count:<15} | {pct:>4.1f}%")

    # 2. Print Multi-value (CSV) Tags Distribution Detail
    print(f"\nMulti-value (CSV) Tags Distribution Detail:")
    print(f"{'='*90}")
    for tag in sorted(MULTIVALUE_TAGS):
        vals = tag_values.get(tag, [])
        if not vals:
            continue
        rule_total = tag_rule_counts.get(tag, 0)
        print(f"\nTag: '{tag}' (Rules with tag: {rule_total}, unique values: {len(set(vals))})")
        print(f"  {'-'*76}")
        print(f"  {'Value':<45} | {'Rules Count':<11} | {'% of Rules':<10}")
        print(f"  {'-'*72}")
        counter = Counter(vals)
        for val, count in counter.most_common(15):
            pct = (count / rule_total) * 100
            truncated_val = val[:45] if len(val) <= 45 else val[:42] + "..."
            print(f"  {truncated_val:<45} | {count:<11} | {pct:>9.1f}%")
        if len(counter) > 15:
            print(f"  ... and {len(counter) - 15} more unique values")

    # 3. Print details for Enum tags
    print(f"\nCategory (Enum) Tags Distribution Detail:")
    print(f"{'='*90}")
    for tag, vals in sorted(enum_tags):
        counter = Counter(vals)
        rule_count = tag_rule_counts[tag]
        print(f"\nTag: '{tag}' (Coverage: {rule_count}/{total_rules})")
        print(f"  {'-'*50}")
        for val, count in counter.most_common(10):
            pct = (count / len(vals)) * 100
            print(f"  {val:<35} | {count:<5} | {pct:>4.1f}%")
        if len(counter) > 10:
            print(f"  ... and {len(counter) - 10} more unique values")

    # 4. Print details for Text tags (Quality Check for duplicates)
    print(f"\nFree Text Tags Duplicate Value Analysis (Quality Check):")
    print(f"{'='*90}")
    for tag, vals, file_map in sorted(text_tags):
        # Only run quality check for tags where duplicates are suspicious
        if tag not in SUSPICIOUS_DUPLICATE_TAGS:
            continue
            
        duplicates = {val: files for val, files in file_map.items() if len(files) > 1}
        if duplicates:
            print(f"\nTag: '{tag}' has duplicate values in different rules:")
            print(f"  {'-'*86}")
            for val, files in sorted(duplicates.items(), key=lambda x: len(x[1]), reverse=True)[:5]:
                truncated_val = val[:50] + "..." if len(val) > 50 else val
                print(f"  Value: \"{truncated_val}\"")
                print(f"    Shared by ({len(files)} rules): {', '.join(files[:5])}" + (f" and {len(files)-5} more" if len(files) > 5 else ""))
            if len(duplicates) > 5:
                print(f"  ... and {len(duplicates) - 5} more duplicate values found.")
        else:
            print(f"\nTag: '{tag}' has 100% unique values (Perfect Quality).")


def main():
    parser = argparse.ArgumentParser(
        description="Generate stats and inspect quality of YARA-L rule metadata."
    )
    parser.add_argument(
        "--rules-dir",
        type=pathlib.Path,
        default=pathlib.Path(__file__).parent.parent
        / "content"
        / "secops"
        / "rules",
        help="Directory containing YARA-L rules",
    )
    parser.add_argument(
        "--include-archived",
        action="store_true",
        help="Include archived rules in the stats",
    )
    parser.add_argument(
        "--sort",
        choices=["count-desc", "count-asc", "key-asc", "key-desc"],
        default="count-desc",
        help="Sorting option for general key stats",
    )
    parser.add_argument(
        "--tag",
        type=str,
        help="Analyze the values of a specific metadata tag",
    )
    parser.add_argument(
        "--group-by",
        type=str,
        help="Group the values of the analyzed --tag by another tag (e.g. type)",
    )
    parser.add_argument(
        "--rule-type",
        type=str,
        help="Filter processed rules by rule type (e.g. alert, hunt)",
    )
    parser.add_argument(
        "--report",
        action="store_true",
        help="Generate a metadata quality and classification report",
    )

    args = parser.parse_args()

    if not args.rules_dir.exists():
        print(f"Error: Rules directory '{args.rules_dir}' does not exist.")
        return

    metadata_list, total_processed, total_files = collect_metadata(
        args.rules_dir, args.include_archived, args.rule_type
    )

    if not metadata_list:
        print("No metadata keys found or no rules matched the filter.")
        return

    if args.report:
        generate_quality_report(metadata_list, total_processed)
    elif args.tag:
        analyze_tag(metadata_list, args.tag, args.group_by)
    else:
        print_general_stats(metadata_list, total_processed, args.sort)


if __name__ == "__main__":
    main()
