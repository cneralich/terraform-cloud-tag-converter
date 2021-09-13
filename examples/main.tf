module "tag_converter" {
  source = "../tag_module"
}

# Pass Provider tags
provider "aws" {
  default_tags {
    tags = module.tag_converter.tags
  }
}
