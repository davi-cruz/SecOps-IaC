# Google SecOps YARA-L Metadata Style Guide

This document defines the standard metadata tags for YARA-L rules in this repository. Consistent metadata is crucial for rule categorization, automated testing, and integration with downstream security operations tools.

---

## 1. Core Metadata (Required)

These fields must be present in every YARA-L rule. The linter enforces their presence and validity.

### `author`
*   **Status**: Required
*   **Description**: The author or team that created/modified the rule.
*   **Format**: Free text (usually name of company/team).
*   **Example**: `author = "Google Cloud Security"`

### `description`
*   **Status**: Required
*   **Description**: A clear and concise explanation of what the rule detects, including the threat context.
*   **Format**: Free text (should not be empty).
*   **Example**: `description = "Detects the execution of cmd.exe via PsExec, which is commonly associated with lateral movement."`

### `severity`
*   **Status**: Required
*   **Description**: The technical severity of the detection.
*   **Allowed Values**: `Info`, `Low`, `Medium`, `High`, `Critical`
*   **Example**: `severity = "Medium"`

---

## 2. Triage & Context Metadata (Recommended)

These fields provide context during triage and help analysts understand the scope of the rule.

### `priority`
*   **Status**: Recommended
*   **Description**: The urgency of triage for this detection. Can differ from severity if the detection has high severity but low confidence.
*   **Allowed Values**: `Info`, `Low`, `Medium`, `High`, `Critical`
*   **Example**: `priority = "High"`

### `data_source`
*   **Status**: Recommended
*   **Description**: The primary log source(s) required for this rule to function.
*   **Format**: Free text (use consistent naming).
*   **Example**: `data_source = "EDR logs"` or `data_source = "GCP Cloud Audit Logs"`

### `platform`
*   **Status**: Recommended
*   **Description**: The target operating system or cloud platform.
*   **Format**: Free text. Common values: `Windows`, `Linux`, `macOS`, `AWS`, `GCP`, `Azure`.
*   **Example**: `platform = "Windows"`

### `type`
*   **Status**: Recommended
*   **Description**: The type of detection rule.
*   **Allowed Values**: `Alert`, `Hunt`, `Producer`, `Policy Violation`
*   **Example**: `type = "Alert"`


### `display_name`
*   **Status**: Optional (Recommended for Case Management)
*   **Description**: A human-readable, non-snake_case name of the rule. Useful for display in case management (SOAR) and reporting.
*   **Format**: Free text.
*   **Example**: `display_name = "Access to Honeypot Secret"`
*   *Note*: To pass this name to case management (SOAR), you should also define it as an outcome variable in the rule's `outcome:` section (e.g., `$display_name = "Access to Honeypot Secret"`).

### `namespace`
*   **Status**: Optional (Use when rule targets a specific log namespace)
*   **Description**: The specific Google SecOps (Chronicle) log namespace context this rule applies to.
*   **Format**: Free text (usually alphanumeric, e.g. `LogStory`).
*   **Example**: `namespace = "LogStory"`

---

## 3. MITRE ATT&CK Mapping

Mapping rules to the MITRE ATT&CK framework helps visualize defense coverage in the Google SecOps MITRE ATT&CK Dashboard.

### `technique`
*   **Status**: Recommended (Crucial for Dashboard Coverage)
*   **Description**: The MITRE ATT&CK Technique ID (including sub-techniques). This is the key recognized by the Google SecOps MITRE ATT&CK Dashboard to calculate coverage.
*   **Format**: Comma-separated list of valid MITRE Technique IDs (T-codes and sub-techniques).
*   **Example**: `technique = "T1548,T1134.001"`

### `tactic`
*   **Status**: Optional (Recommended for Composite Detections)
*   **Description**: The MITRE ATT&CK Tactic ID or Name. While the MITRE Dashboard automatically derives tactics from technique IDs, this tag is required if you want to correlate detections by tactic in **Composite Detection Rules** (via `rule_labels["tactic"]`).
*   **Format**: MITRE Tactic ID (e.g., `TA0002`) or Tactic Name (e.g., `Execution`).
*   **Example**: `tactic = "TA0002"` or `tactic = "Execution"`

### `mitre_attack_technique`
*   **Status**: Recommended
*   **Description**: The human-readable name of the MITRE ATT&CK Technique. Used for documentation purposes in the rule.
*   **Format**: Free text.
*   **Example**: `mitre_attack_technique = "Command and Scripting Interpreter"`

### `mitre_attack_tactic`
*   **Status**: Recommended
*   **Description**: The human-readable name of the MITRE ATT&CK Tactic.
*   **Format**: Free text.
*   **Example**: `mitre_attack_tactic = "Execution"`

### `mitre_attack_url`
*   **Status**: Recommended
*   **Description**: Link to the MITRE ATT&CK page for the technique.
*   **Format**: URL.
*   **Example**: `mitre_attack_url = "https://attack.mitre.org/techniques/T1059/"`

### `mitre_attack_version`
*   **Status**: Recommended (if mapping to MITRE)
*   **Description**: The version of the MITRE ATT&CK framework used.
*   **Format**: Version string.
*   **Example**: `mitre_attack_version = "v14"`

### `mitre_attack_analytic`
*   **Status**: Optional (MITRE ATT&CK v18+)
*   **Description**: The platform-specific analytic ID (prefixed with `AN`). Represents the technical implementation details of a detection strategy.
*   **Format**: Comma-separated list of MITRE CAR or ATT&CK analytic IDs.
*   **Example**: `mitre_attack_analytic = "AN0001"`

### `mitre_attack_detection_strategy`
*   **Status**: Optional (MITRE ATT&CK v18+)
*   **Description**: The high-level detection strategy ID (prefixed with `DET`). Groups multiple platform-specific analytics into cohesive methodologies.
*   **Format**: Comma-separated list of MITRE detection strategy IDs.
*   **Example**: `mitre_attack_detection_strategy = "DET0001"`

### `mitre_attack_data_component`
*   **Status**: Optional (MITRE ATT&CK v18+)
*   **Description**: The specific data component ID (prefixed with `DC`) monitored by the rule to perform the detection. Maps directly to the official MITRE ATT&CK Data Sources.
*   **Format**: Comma-separated list of MITRE data component IDs.
*   **Example**: `mitre_attack_data_component = "DC0001"`

---

## 4. MITRE D3FEND Mapping

Mapping rules to the MITRE D3FEND framework helps describe the defensive technologies and analysis techniques applied by the detection rule.

### `d3fend_technique`
*   **Status**: Optional
*   **Description**: The MITRE D3FEND Defensive Technique ID (prefixed with `D3-`).
*   **Format**: Comma-separated list of valid D3FEND IDs (D3- prefix followed by the uppercase abbreviation of the technique).
*   **Example**: `d3fend_technique = "D3-DNSTA"` or `d3fend_technique = "D3-DNSTA,D3-PSA"`

---

## 5. Documentation & Incident Response

### `reference`
*   **Status**: Optional (Highly encouraged)
*   **Description**: External links to threat intelligence reports, blog posts, or internal documentation.
*   **Format**: URL.
*   **Example**: `reference = "https://advantage.mandiant.com/actors/threat-actor--8824cd44-bc42-581b-8261-22425265609e"`

### `assumption`
*   **Status**: Optional
*   **Description**: Pre-requisites or assumptions about the environment/logging required for the rule to work.
*   **Format**: Free text.
*   **Example**: `assumption = "Requires PowerShell logging (Event ID 4104) to be enabled."`

### `false_positives`
*   **Status**: Optional
*   **Description**: Known scenarios that might trigger this rule but are benign.
*   **Format**: Free text.
*   **Example**: `false_positives = "Administrators using remote execution tools for scheduled maintenance."`

### `playbook`
*   **Status**: Optional
*   **Description**: Link or reference to the Incident Response playbook for this alert.
*   **Format**: URL or Playbook ID.
*   **Example**: `playbook = "https://wiki.internal/ir/playbooks/compromised-credentials"`

### `tags`
*   **Status**: Optional
*   **Description**: Generic keywords for arbitrary grouping (e.g., threat actor names, campaigns, compliance standards).
*   **Format**: Free text (comma-separated list if multiple).
*   **Example**: `tags = "unc3944, pci-dss"`

---

## 6. Deprecated & Erroneous Tags

The following tags have been found in the repository but are **deprecated** or are **typos**. Do not use them in new rules, and replace them when updating existing rules:

| Deprecated/Erroneous Tag | Action / Replace With | Reason |
| :--- | :--- | :--- |
| `mitre_attach_url` | Use `mitre_attack_url` | Typo |
| `mitre_attack_technique_id`| Use `technique` | Not recognized by the Google SecOps MITRE dashboard |
| `mitre_attack_tactic_id` | Remove | Mapped automatically by the dashboard; not recognized by it |
| `techniques` | Use `technique` | Typo/Plural variant |
| `mitre_attack_id` | Use `technique` | Ambiguous; does not specify technique vs tactic |
| `assumptions` | Use `assumption` | Typo/Plural variant |
| `log_source` | Use `data_source` | Duplicate of `data_source` |
| `politica` | Use `tags` or `reference` | Typo (Spanish/Portuguese for policy) or non-standard |
| `rule_name` | Use `display_name` | Redundant with header, but `display_name` can be used for case management |
| `created` | Remove | Version control (Git) tracks file creation history |
| `version` | Remove | Version control (Git) tracks file revision history |
| `yara_version` | Remove | Non-standard metadata tag |
| `alerting` | Use `type` (e.g., `type = "Alert"`) | Non-standard |
| `connector` | Use `data_source` | Non-standard |

---

## 7. Linter Enforcement

The YARA-L style linter (`test_style_guide.py`) checks rules against the configuration in `style_config.yaml`. 

To run the linter locally:
```bash
pytest tools/secops_content_manager/content_manager/test_style_guide.py
```
