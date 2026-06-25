# SecOps-IaC

Repository for Google Security Operations Infrastructure as Code.

## 🚀 To-Do / Roadmap

### Metadata Standardisation
- [ ] **Standardise `data_source` Values:** Migrate free-text `data_source` metadata tags to a standardized uppercase code list (e.g. `WINDOWS_SYSMON`, `AWS_CLOUDTRAIL`, `OKTA`) corresponding to Chronicle ingestion log types. Enable strict validation in the linter once migrated.