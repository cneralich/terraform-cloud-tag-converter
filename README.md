# TFC Workspace Tag Converter

This Module can be leveraged to automatically pull any tag values assigned to a Workspace in Terraform Cloud so that they can be passed as `key/value` pairs to Terraform Providers and Resources.  For any compound tags that are separated by a colon (`:`), this module will split the tag and create a `key/value` pair.  For example, if the tag is `key:value`, this module will convert it to `key = "value"`.  If the tag is a single value, however, this module will use the tag as both the `key` and the `value`, but it will prefix the `key` with the string "tag" (ex. "mytag" would become `tag-mytag = "mytag"`).  
