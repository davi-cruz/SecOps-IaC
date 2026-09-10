data "google_secret_manager_secret_version" "office365_credentials" {
  count   = var.office365_credentials_secret_name != "" ? 1 : 0
  project = var.project_id
  secret  = var.office365_credentials_secret_name
}

data "google_secret_manager_secret_version" "entra_credentials" {
  count   = var.entra_credentials_secret_name != "" ? 1 : 0
  project = var.project_id
  secret  = var.entra_credentials_secret_name
}

# 1. GWS Service Account Raw JSON Key Secrets
data "google_secret_manager_secret_version" "gws_shared_sa_key" {
  count   = var.gws_sa_credentials_secret_name != "" ? 1 : 0
  project = var.project_id
  secret  = var.gws_sa_credentials_secret_name
}

data "google_secret_manager_secret_version" "gws_davicruz_sa_key" {
  count   = var.gws_davicruz_sa_credentials_secret_name != "" ? 1 : 0
  project = var.project_id
  secret  = var.gws_davicruz_sa_credentials_secret_name
}

data "google_secret_manager_secret_version" "gws_driveforjob_sa_key" {
  count   = var.gws_driveforjob_sa_credentials_secret_name != "" ? 1 : 0
  project = var.project_id
  secret  = var.gws_driveforjob_sa_credentials_secret_name
}

# 2. GWS Org Config Secrets (admin_email, customer_id)
data "google_secret_manager_secret_version" "gws_davicruz_config" {
  count   = var.gws_davicruz_config_secret_name != "" ? 1 : 0
  project = var.project_id
  secret  = var.gws_davicruz_config_secret_name
}

data "google_secret_manager_secret_version" "gws_driveforjob_config" {
  count   = var.gws_driveforjob_config_secret_name != "" ? 1 : 0
  project = var.project_id
  secret  = var.gws_driveforjob_config_secret_name
}

# 3. Optional Legacy Bundled Secrets
data "google_secret_manager_secret_version" "gws_davicruz_legacy" {
  count   = var.gws_davicruz_credentials_secret_name != "" ? 1 : 0
  project = var.project_id
  secret  = var.gws_davicruz_credentials_secret_name
}

data "google_secret_manager_secret_version" "gws_driveforjob_legacy" {
  count   = var.gws_driveforjob_credentials_secret_name != "" ? 1 : 0
  project = var.project_id
  secret  = var.gws_driveforjob_credentials_secret_name
}

locals {
  feeds_raw = yamldecode(file(var.feeds_config_path))

  office365_creds = length(data.google_secret_manager_secret_version.office365_credentials) > 0 ? jsondecode(data.google_secret_manager_secret_version.office365_credentials[0].secret_data) : {
    tenant_id     = "00000000-0000-0000-0000-000000000000"
    client_id     = "00000000-0000-0000-0000-000000000000"
    client_secret = "dummy-secret"
  }

  entra_creds = length(data.google_secret_manager_secret_version.entra_credentials) > 0 ? jsondecode(data.google_secret_manager_secret_version.entra_credentials[0].secret_data) : {
    tenant_id     = "00000000-0000-0000-0000-000000000000"
    client_id     = "00000000-0000-0000-0000-000000000000"
    client_secret = "dummy-secret"
  }

  # Service Account JSON decodes
  gws_shared_sa      = length(data.google_secret_manager_secret_version.gws_shared_sa_key) > 0 ? jsondecode(data.google_secret_manager_secret_version.gws_shared_sa_key[0].secret_data) : {}
  gws_davicruz_sa    = length(data.google_secret_manager_secret_version.gws_davicruz_sa_key) > 0 ? jsondecode(data.google_secret_manager_secret_version.gws_davicruz_sa_key[0].secret_data) : local.gws_shared_sa
  gws_driveforjob_sa = length(data.google_secret_manager_secret_version.gws_driveforjob_sa_key) > 0 ? jsondecode(data.google_secret_manager_secret_version.gws_driveforjob_sa_key[0].secret_data) : local.gws_shared_sa

  # Org Config JSON decodes
  gws_davicruz_cfg    = length(data.google_secret_manager_secret_version.gws_davicruz_config) > 0 ? jsondecode(data.google_secret_manager_secret_version.gws_davicruz_config[0].secret_data) : {}
  gws_driveforjob_cfg = length(data.google_secret_manager_secret_version.gws_driveforjob_config) > 0 ? jsondecode(data.google_secret_manager_secret_version.gws_driveforjob_config[0].secret_data) : {}

  # Legacy bundled decodes
  gws_davicruz_legacy_data    = length(data.google_secret_manager_secret_version.gws_davicruz_legacy) > 0 ? jsondecode(data.google_secret_manager_secret_version.gws_davicruz_legacy[0].secret_data) : {}
  gws_driveforjob_legacy_data = length(data.google_secret_manager_secret_version.gws_driveforjob_legacy) > 0 ? jsondecode(data.google_secret_manager_secret_version.gws_driveforjob_legacy[0].secret_data) : {}

  # Resolved DaviCruz credentials
  gws_davicruz_creds = {
    customer_id           = coalesce(lookup(local.gws_davicruz_legacy_data, "customer_id", null), lookup(local.gws_davicruz_cfg, "customer_id", null), var.gws_davicruz_customer_id, "")
    admin_email           = coalesce(lookup(local.gws_davicruz_legacy_data, "admin_email", null), lookup(local.gws_davicruz_cfg, "admin_email", null), var.gws_davicruz_admin_email, "")
    service_account_email = coalesce(lookup(local.gws_davicruz_legacy_data, "service_account_email", null), lookup(local.gws_davicruz_sa, "client_email", null), lookup(local.gws_davicruz_sa, "service_account_email", null), "")
    private_key           = coalesce(lookup(local.gws_davicruz_legacy_data, "private_key", null), lookup(local.gws_davicruz_sa, "private_key", null), "")
  }

  # Resolved DriveForJob credentials
  gws_driveforjob_creds = {
    customer_id           = coalesce(lookup(local.gws_driveforjob_legacy_data, "customer_id", null), lookup(local.gws_driveforjob_cfg, "customer_id", null), var.gws_driveforjob_customer_id, "")
    admin_email           = coalesce(lookup(local.gws_driveforjob_legacy_data, "admin_email", null), lookup(local.gws_driveforjob_cfg, "admin_email", null), var.gws_driveforjob_admin_email, "")
    service_account_email = coalesce(lookup(local.gws_driveforjob_legacy_data, "service_account_email", null), lookup(local.gws_driveforjob_sa, "client_email", null), lookup(local.gws_driveforjob_sa, "service_account_email", null), "")
    private_key           = coalesce(lookup(local.gws_driveforjob_legacy_data, "private_key", null), lookup(local.gws_driveforjob_sa, "private_key", null), "")
  }

  gws_creds_map = {
    "davicruz"    = local.gws_davicruz_creds
    "driveforjob" = local.gws_driveforjob_creds
  }

  customer_id_map = {
    "gws_davicruz_customer_id"    = var.gws_davicruz_customer_id
    "gws_driveforjob_customer_id" = var.gws_driveforjob_customer_id
  }

  # Flatten Google Workspace feeds
  workspace_feeds = merge([
    for org_key, org in lookup(local.feeds_raw, "workspace_orgs", {}) : {
      for feed in org.feeds :
      "${org_key}_gws_${feed.name}" => {
        display_name          = feed.display_name
        log_type              = feed.log_type
        feed_source_type      = feed.feed_source_type
        feed_category         = "WORKSPACE"
        customer_id           = coalesce(lookup(lookup(local.gws_creds_map, org_key, {}), "customer_id", ""), lookup(local.customer_id_map, org.customer_id_var, ""), "unknown")
        admin_email           = lookup(lookup(local.gws_creds_map, org_key, {}), "admin_email", "")
        service_account_email = lookup(lookup(local.gws_creds_map, org_key, {}), "service_account_email", "")
        private_key           = lookup(lookup(local.gws_creds_map, org_key, {}), "private_key", "")
        applications          = lookup(feed, "applications", null)
        content_type          = null
        retrieve_devices      = null
        retrieve_groups       = null
        hostname              = null
      }
    }
  ]...)

  # Flatten Microsoft Office 365 feeds
  m365_feeds = merge([
    for tenant_key, tenant in lookup(local.feeds_raw, "microsoft_tenants", {}) : {
      for feed in lookup(tenant, "office_365_feeds", []) :
      "${tenant_key}_office_${feed.name}" => {
        display_name          = feed.display_name
        log_type              = "OFFICE_365"
        feed_source_type      = "API"
        feed_category         = "OFFICE_365"
        customer_id           = null
        admin_email           = null
        service_account_email = null
        private_key           = null
        applications          = null
        content_type          = feed.content_type
        retrieve_devices      = null
        retrieve_groups       = null
        hostname              = null
      }
    }
  ]...)

  # Flatten Microsoft Entra ID feeds
  entra_feeds = merge([
    for tenant_key, tenant in lookup(local.feeds_raw, "microsoft_tenants", {}) : {
      for feed in lookup(tenant, "entra_id_feeds", []) :
      "${tenant_key}_entra_${feed.name}" => {
        display_name          = feed.display_name
        log_type              = feed.log_type
        feed_source_type      = "API"
        feed_category         = feed.feed_type
        customer_id           = null
        admin_email           = null
        service_account_email = null
        private_key           = null
        applications          = null
        content_type          = null
        retrieve_devices      = lookup(feed, "retrieve_devices", null)
        retrieve_groups       = lookup(feed, "retrieve_groups", null)
        hostname              = lookup(feed, "hostname", null)
      }
    }
  ]...)

  all_feeds = merge(local.workspace_feeds, local.m365_feeds, local.entra_feeds)
}

resource "google_chronicle_feed" "feeds" {
  for_each = local.all_feeds

  project      = var.project_id
  location     = var.chronicle_location
  instance     = var.chronicle_instance_id
  display_name = each.value.display_name

  details {
    feed_source_type = each.value.feed_source_type
    log_type         = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/logTypes/${each.value.log_type}"

    # Google Workspace Feeds
    dynamic "workspace_chrome_os_settings" {
      for_each = each.value.log_type == "WORKSPACE_CHROMEOS" ? [1] : []
      content {
        workspace_customer_id = each.value.customer_id
        dynamic "authentication" {
          for_each = each.value.private_key != "" ? [1] : []
          content {
            token_endpoint = "https://oauth2.googleapis.com/token"
            claims {
              issuer   = each.value.service_account_email
              subject  = each.value.admin_email
              audience = "https://oauth2.googleapis.com/token"
            }
            rs_credentials {
              private_key = each.value.private_key
            }
          }
        }
      }
    }

    dynamic "workspace_alerts_settings" {
      for_each = each.value.log_type == "WORKSPACE_ALERTS" ? [1] : []
      content {
        workspace_customer_id = each.value.customer_id
        dynamic "authentication" {
          for_each = each.value.private_key != "" ? [1] : []
          content {
            token_endpoint = "https://oauth2.googleapis.com/token"
            claims {
              issuer   = each.value.service_account_email
              subject  = each.value.admin_email
              audience = "https://oauth2.googleapis.com/token"
            }
            rs_credentials {
              private_key = each.value.private_key
            }
          }
        }
      }
    }

    dynamic "workspace_mobile_settings" {
      for_each = each.value.log_type == "WORKSPACE_MOBILE" ? [1] : []
      content {
        workspace_customer_id = each.value.customer_id
        dynamic "authentication" {
          for_each = each.value.private_key != "" ? [1] : []
          content {
            token_endpoint = "https://oauth2.googleapis.com/token"
            claims {
              issuer   = each.value.service_account_email
              subject  = each.value.admin_email
              audience = "https://oauth2.googleapis.com/token"
            }
            rs_credentials {
              private_key = each.value.private_key
            }
          }
        }
      }
    }

    dynamic "workspace_privileges_settings" {
      for_each = each.value.log_type == "WORKSPACE_PRIVILEGES" ? [1] : []
      content {
        workspace_customer_id = each.value.customer_id
        dynamic "authentication" {
          for_each = each.value.private_key != "" ? [1] : []
          content {
            token_endpoint = "https://oauth2.googleapis.com/token"
            claims {
              issuer   = each.value.service_account_email
              subject  = each.value.admin_email
              audience = "https://oauth2.googleapis.com/token"
            }
            rs_credentials {
              private_key = each.value.private_key
            }
          }
        }
      }
    }

    dynamic "workspace_users_settings" {
      for_each = each.value.log_type == "WORKSPACE_USERS" ? [1] : []
      content {
        workspace_customer_id = each.value.customer_id
        dynamic "authentication" {
          for_each = each.value.private_key != "" ? [1] : []
          content {
            token_endpoint = "https://oauth2.googleapis.com/token"
            claims {
              issuer   = each.value.service_account_email
              subject  = each.value.admin_email
              audience = "https://oauth2.googleapis.com/token"
            }
            rs_credentials {
              private_key = each.value.private_key
            }
          }
        }
      }
    }

    dynamic "workspace_groups_settings" {
      for_each = each.value.log_type == "WORKSPACE_GROUPS" ? [1] : []
      content {
        workspace_customer_id = each.value.customer_id
        dynamic "authentication" {
          for_each = each.value.private_key != "" ? [1] : []
          content {
            token_endpoint = "https://oauth2.googleapis.com/token"
            claims {
              issuer   = each.value.service_account_email
              subject  = each.value.admin_email
              audience = "https://oauth2.googleapis.com/token"
            }
            rs_credentials {
              private_key = each.value.private_key
            }
          }
        }
      }
    }

    dynamic "workspace_activity_settings" {
      for_each = each.value.log_type == "WORKSPACE_ACTIVITY" ? [1] : []
      content {
        workspace_customer_id = each.value.customer_id
        applications          = each.value.applications
        dynamic "authentication" {
          for_each = each.value.private_key != "" ? [1] : []
          content {
            token_endpoint = "https://oauth2.googleapis.com/token"
            claims {
              issuer   = each.value.service_account_email
              subject  = each.value.admin_email
              audience = "https://oauth2.googleapis.com/token"
            }
            rs_credentials {
              private_key = each.value.private_key
            }
          }
        }
      }
    }

    # Microsoft Office 365
    dynamic "office365_settings" {
      for_each = each.value.feed_category == "OFFICE_365" ? [1] : []
      content {
        tenant_id    = local.office365_creds.tenant_id
        content_type = each.value.content_type
        authentication {
          client_id     = local.office365_creds.client_id
          client_secret = local.office365_creds.client_secret
        }
      }
    }

    # Microsoft Entra ID (Sign-in)
    dynamic "azure_ad_settings" {
      for_each = each.value.feed_category == "AZURE_AD" ? [1] : []
      content {
        tenant_id = local.entra_creds.tenant_id
        authentication {
          client_id     = local.entra_creds.client_id
          client_secret = local.entra_creds.client_secret
        }
      }
    }

    # Microsoft Entra ID (Audit)
    dynamic "azure_ad_audit_settings" {
      for_each = each.value.feed_category == "AZURE_AD_AUDIT" ? [1] : []
      content {
        tenant_id = local.entra_creds.tenant_id
        authentication {
          client_id     = local.entra_creds.client_id
          client_secret = local.entra_creds.client_secret
        }
      }
    }

    # Microsoft Entra ID (Org Context)
    dynamic "azure_ad_context_settings" {
      for_each = each.value.feed_category == "AZURE_AD_CONTEXT" ? [1] : []
      content {
        tenant_id        = local.entra_creds.tenant_id
        hostname         = "graph.microsoft.com/v1.0"
        auth_endpoint    = "login.microsoftonline.com"
        retrieve_devices = each.value.retrieve_devices
        retrieve_groups  = each.value.retrieve_groups
        authentication {
          client_id     = local.entra_creds.client_id
          client_secret = local.entra_creds.client_secret
        }
      }
    }

    # Microsoft Graph API Alerts
    dynamic "microsoft_graph_alert_settings" {
      for_each = each.value.feed_category == "MICROSOFT_GRAPH_ALERT" ? [1] : []
      content {
        tenant_id = local.entra_creds.tenant_id
        hostname  = each.value.hostname
        authentication {
          client_id     = local.entra_creds.client_id
          client_secret = local.entra_creds.client_secret
        }
      }
    }
  }
}
