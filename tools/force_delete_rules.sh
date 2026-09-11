#!/usr/bin/env bash
# Copyright 2026 Google LLC
#
# Helper script to force-delete archived Chronicle detection rules with associated
# retrohunts/detections directly via Chronicle REST API (?force=true).
# Designed to run in CI/CD before Terraform apply without failing the pipeline.

set -uo pipefail

PROJECT_ID="${TF_VAR_project_id:-${GOOGLE_CLOUD_PROJECT_ID:-secops-gaia}}"
LOCATION="${TF_VAR_chronicle_location:-${GOOGLE_SECOPS_LOCATION:-us}}"
INSTANCE_ID="${TF_VAR_chronicle_instance_id:-${GOOGLE_SECOPS_INSTANCE_UUID:-14017248-91b1-4217-9e51-8c3aa4cba640}}"
BASE_URL="${GOOGLE_SECOPS_API_BASE_URL:-https://us-chronicle.googleapis.com/v1alpha}"

echo "=== Force Deleting Archived Rules from Chronicle ==="
echo "Project:  ${PROJECT_ID}"
echo "Location: ${LOCATION}"
echo "Instance: ${INSTANCE_ID}"

TOKEN=""
if command -v gcloud &>/dev/null; then
  TOKEN="$(gcloud auth print-access-token 2>/dev/null || true)"
fi

if [ -z "${TOKEN}" ]; then
  echo "WARNING: Could not obtain gcloud access token. Skipping direct API deletion."
  exit 0
fi

ARCHIVED_RULE_IDS=(
  "ru_118b1fd8-75ae-4bed-b903-89a5224678a4"  # cloud_honeypot_secret_access_archived_37840bc
  "ru_76b497a9-85ba-4b6f-94c2-7026ef467b9a"  # prt_use_case_1_archived_37840bc
  "ru_984c5ee1-a5c2-4ecb-b7d4-0302e1c74607"  # rule_1727979376900_archived_37840bc
  "ru_2e31e47d-fd24-498f-90f9-936464d8058c"  # rule_1750794727496_archived_37840bc
  "ru_101df42b-37f9-4e2a-b151-8f9e44ccb7c0"  # suspicious_auth_unusual_interval_time_archived_37840bc
)

for RULE_ID in "${ARCHIVED_RULE_IDS[@]}"; do
  echo "Attempting force-delete for rule: ${RULE_ID}"
  URL="${BASE_URL}/projects/${PROJECT_ID}/locations/${LOCATION}/instances/${INSTANCE_ID}/rules/${RULE_ID}?force=true"
  
  RESPONSE="$(curl -s -w "\n%{http_code}" -X DELETE -H "Authorization: Bearer ${TOKEN}" "${URL}" || true)"
  HTTP_CODE="$(echo "${RESPONSE}" | tail -n 1)"
  BODY="$(echo "${RESPONSE}" | sed '$d')"

  if [ "${HTTP_CODE}" = "200" ] || [ "${HTTP_CODE}" = "204" ]; then
    echo "  -> Successfully force-deleted ${RULE_ID} (HTTP ${HTTP_CODE})"
  elif [ "${HTTP_CODE}" = "404" ]; then
    echo "  -> Rule ${RULE_ID} does not exist or already deleted (HTTP 404)"
  else
    echo "  -> WARNING: Could not delete ${RULE_ID} (HTTP ${HTTP_CODE}): ${BODY}"
    echo "  -> Skipping rule without failing the pipeline."
  fi
done

echo "Force-delete sweep completed."
exit 0
