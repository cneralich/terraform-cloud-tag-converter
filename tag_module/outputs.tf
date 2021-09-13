output "tags" {
    value = merge(local.single_tags, local.compound_tags)
}
