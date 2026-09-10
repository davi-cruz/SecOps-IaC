# Declarative Terraform Moved Blocks for Chronicle Rules
# When a detection rule is archived or renamed, the archiving helper script appends
# 'moved' blocks here to preserve resource identity and prevent destructive re-creations.
#
# Example syntax:
# moved {
#   from = module.chronicle_rules.google_chronicle_rule.rules["old_rule_name"]
#   to   = module.chronicle_rules.google_chronicle_rule.rules["archived/old_rule_name_archived_a1b2c3d"]
# }
#
# moved {
#   from = module.chronicle_rules.google_chronicle_rule_deployment.deployments["old_rule_name"]
#   to   = module.chronicle_rules.google_chronicle_rule_deployment.deployments["archived/old_rule_name_archived_a1b2c3d"]
# }
