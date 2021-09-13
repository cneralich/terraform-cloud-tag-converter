data "tfe_workspace" "test" {
  name         = var.tfc_workspace_name
  organization = split("/",var.tfc_workspace_slug)[0]
}

variable "TFC_WORKSPACE_NAME" {}
variable "TFC_WORKSPACE_SLUG" {}

locals {
  single_tags = {
    for tag in data.tfe_workspace.test.tag_names : format("%s-%s","tag",tag) => tag
    if length(regexall("[:]+", tag)) == 0
  }
  compound_tags = {
    for tag in data.tfe_workspace.test.tag_names : split(":",tag)[0] => split(":",tag)[1]
    if length(regexall("[:]+", tag)) > 0
  }
}

output "tags" {
    value = merge(local.single_tags, local.compound_tags)
}
