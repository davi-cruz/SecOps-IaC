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
"""Dynamically enrich BindPlane configurations with secrets from GCP Secret Manager.

This script scans BindPlane YAML configurations, identifies placeholders matching
${GCP_SECRET_...}, fetches the corresponding secrets from GCP Secret Manager,
and replaces the placeholders in the configurations before deployment.
"""

import os
import subprocess
from pathlib import Path
from ruamel.yaml import YAML

# Initialize YAML parser that preserves formatting and comments
yaml = YAML()
yaml.preserve_quotes = True
yaml.indent(mapping=4, sequence=4, offset=2)

def get_secret_from_gcp(secret_name: str) -> str:
    """Fetch the latest version of a secret from GCP Secret Manager using gcloud."""
    project_id = os.environ.get("GOOGLE_CLOUD_PROJECT_ID")
    if not project_id:
        raise ValueError("GOOGLE_CLOUD_PROJECT_ID environment variable is not set.")
    
    secret_path = f"projects/{project_id}/secrets/{secret_name}/versions/latest"
    print(f"Fetching secret from GCP: {secret_path}")
    
    try:
        result = subprocess.run(
            ["gcloud", "secrets", "versions", "access", "latest", f"--secret={secret_name}"],
            capture_output=True,
            text=True,
            check=True
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        print(f"Error fetching secret {secret_name}: {e.stderr}")
        raise

def process_file(file_path: Path) -> bool:
    """Process a single YAML file, replacing secret placeholders."""
    try:
        with open(file_path, 'r') as f:
            data = yaml.load(f)
    except Exception as e:
        print(f"Error parsing YAML in {file_path}: {e}")
        return False

    if not data or not isinstance(data, dict):
        return False

    spec = data.get("spec", {})
    parameters = spec.get("parameters", [])
    if not parameters:
        return False

    modified = False
    for param in parameters:
        if not isinstance(param, dict):
            continue
        
        val = param.get("value")
        # Check if value is a string and matches our placeholder convention: ${GCP_SECRET_...}
        if isinstance(val, str) and val.startswith("${GCP_SECRET_") and val.endswith("}"):
            # Extract the variable name (e.g., CHRONICLE_CREDENTIALS)
            secret_var = val[13:-1]
            
            # Map the variable name to GCP Secret Manager naming convention (kebab-case)
            # e.g., CHRONICLE_CREDENTIALS -> chronicle-credentials
            gcp_secret_name = secret_var.lower().replace("_", "-")
            
            try:
                secret_value = get_secret_from_gcp(gcp_secret_name)
                # Replace the placeholder with the actual secret value
                param["value"] = secret_value
                modified = True
                print(f"Enriched parameter '{param.get('name')}' in {file_path.name}")
            except Exception as e:
                print(f"Failed to enrich parameter '{param.get('name')}' in {file_path.name}: {e}")
                raise

    if modified:
        with open(file_path, 'w') as f:
            yaml.dump(data, f)
        return True
    
    return False

def main():
    # Scan content/bindplane for all yaml files
    bindplane_dir = Path("content/bindplane")
    if not bindplane_dir.exists():
        print("Directory content/bindplane not found. Run from repository root.")
        return

    print("Scanning BindPlane configurations for secret placeholders...")
    enriched_count = 0
    for yaml_file in bindplane_dir.glob("**/*.yaml"):
        if process_file(yaml_file):
            enriched_count += 1

    print(f"Completed. Enriched {enriched_count} files.")

if __name__ == "__main__":
    main()
