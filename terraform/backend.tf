terraform {
  backend "gcs" {
    # Specify the state bucket via backend config or CLI:
    # terraform init -backend-config="bucket=<YOUR_TF_STATE_BUCKET>"
    prefix = "secops-iac/state"
  }
}
