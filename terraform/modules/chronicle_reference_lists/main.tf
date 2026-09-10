locals {
  config = yamldecode(file(var.config_file_path))

  reference_lists = {
    for list_name, list_cfg in local.config :
    list_name => {
      description = lookup(list_cfg, "description", list_name)
      syntax_type = lookup(list_cfg, "syntax_type", "REFERENCE_LIST_SYNTAX_TYPE_PLAIN_TEXT_STRING")
      lines = compact(
        split(
          "\n",
          replace(
            try(file("${var.content_dir}/${list_name}.txt"), ""),
            "\r",
            ""
          )
        )
      )
    }
  }
}

resource "google_chronicle_reference_list" "lists" {
  for_each = local.reference_lists

  project           = var.project_id
  location          = var.chronicle_location
  instance          = var.chronicle_instance_id
  reference_list_id = each.key
  description       = each.value.description
  syntax_type       = each.value.syntax_type

  dynamic "entries" {
    for_each = each.value.lines
    content {
      value = entries.value
    }
  }
}
