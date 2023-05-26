locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name

  pipeline_name = var.pipeline_name != null ? var.pipeline_name : "${var.domain_name}-ingest"

  pipeline_log_group = "/aws/vendedlogs/${local.pipeline_name}"

  default_tags = [for k, v in data.aws_default_tags.this.tags.tags : { k = v }]
  tags         = concat([for k, v in var.tags : { k = v }], local.default_tags)
}
