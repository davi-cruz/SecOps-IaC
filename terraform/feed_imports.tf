# Declarative Import Blocks for Existing Chronicle Feeds (Terraform 1.5+)
# These import blocks map existing Google SecOps feeds directly into Terraform state.
# Run 'terraform plan' to verify that all 21 feeds are recognized for import (Plan: 21 to import, 0 to add).

# ==============================================================================
# Google Workspace Feeds - DaviCruz Org
# ==============================================================================
import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["davicruz_gws_chromeos"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/15ef57d6-849f-4b48-b227-c325842e83e9"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["davicruz_gws_alerts"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/21e975c6-2842-40dd-ac2f-e37d13677880"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["davicruz_gws_mobile"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/62f986f2-f19e-4745-aa58-22a5c4284715"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["davicruz_gws_privileges"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/da328e57-a2c0-4649-9643-f2432cc9c4f6"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["davicruz_gws_users"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/e0aa8636-4dc5-421f-a072-5cd58b4623d2"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["davicruz_gws_groups"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/f4ca2ec6-c1bb-4543-b31d-77e661096564"
}

# ==============================================================================
# Google Workspace Feeds - DriveForJob Org
# ==============================================================================
import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["driveforjob_gws_users"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/3abddab4-ec50-44ae-bcb1-3ff441a22cf1"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["driveforjob_gws_alerts"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/6625bc69-dea2-499a-814f-1e7c789d2ddd"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["driveforjob_gws_mobile"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/6c91fc6f-68b3-433e-8930-82800d9a533b"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["driveforjob_gws_groups"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/8d32603b-db0c-46a0-b779-6dde98b51b22"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["driveforjob_gws_chromeos"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/9bf83fd7-3570-4203-81ec-e644531e7c2b"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["driveforjob_gws_privileges"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/a692308f-4515-41b0-a71a-009dce7958b9"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["driveforjob_gws_activity"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/c503a956-6330-48dc-a84d-38e4f2694256"
}

# ==============================================================================
# Microsoft Office 365 Feeds
# ==============================================================================
import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["davicruz_office_exchange"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/75ad0d71-dd44-41b7-b323-be380598fea4"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["davicruz_office_dlp"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/af2364df-007c-45fa-af61-02ccd252f01c"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["davicruz_office_general"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/e53a84b3-d0ca-4182-936a-804d1ad5ab35"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["davicruz_office_sharepoint"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/eb8a83d0-e410-409f-a567-9dea6d028ae4"
}

# ==============================================================================
# Microsoft Entra ID & Graph API Feeds
# ==============================================================================
import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["davicruz_entra_sign_ins"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/100542ca-132c-4852-8a9f-5affb4e12cca"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["davicruz_entra_audit"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/ae9254cb-af8b-4819-9091-20325b59b7de"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["davicruz_entra_context"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/099f8239-df50-4963-ae40-04a9dc1e8b4f"
}

import {
  to = module.chronicle_feeds.google_chronicle_feed.feeds["davicruz_entra_msgraph_alerts"]
  id = "projects/${var.project_id}/locations/${var.chronicle_location}/instances/${var.chronicle_instance_id}/feeds/08fcc208-cc7d-4d5d-9200-1f2d9b2b7732"
}
