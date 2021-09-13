module "tag_converter" {
  source = "../tag_module"
  
  tfc_workspace_name = var.TFC_WORKSPACE_NAME
  tfc_workspace_slug = var.TFC_WORKSPACE_SLUG  
}

# Pass Provider tags
provider "aws" {
  default_tags {
    tags = module.tag_converter.tags
  }
}
