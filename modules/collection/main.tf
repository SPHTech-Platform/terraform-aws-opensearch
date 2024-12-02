module "aoss" {
  source  = "terraform-aws-modules/opensearch/aws//modules/collection"
  version = "~> 1.5.0"

  name        = var.name
  description = var.description
  type        = var.collection_type

  create_access_policy                 = var.create_access_policy
  access_policy_collection_permissions = var.access_policy_collection_permissions
  access_policy_index_permissions      = var.access_policy_index_permissions
  access_policy_principals             = var.access_policy_principals
  access_policy                        = var.access_policy

  create_network_policy = var.create_network_policy
  network_policy        = local.network_policy

  create_encryption_policy = var.create_encryption_policy
  encryption_policy        = local.encryption_policy

  create_lifecycle_policy                 = var.create_lifecycle_policy
  lifecycle_policy_min_index_retention    = var.lifecycle_policy_min_index_retention
  lifecycle_policy_no_min_index_retention = var.lifecycle_policy_no_min_index_retention

  tags = var.tags
}

resource "aws_opensearchserverless_security_config" "saml" {
  count = var.saml_enabled ? 1 : 0

  name        = "${var.name}-saml"
  type        = "saml"
  description = "SAML config for ${var.name}"

  saml_options {
    metadata        = var.saml_metadata_content
    group_attribute = var.saml_group_attribute
    user_attribute  = var.saml_user_attribute
    session_timeout = var.saml_session_timeout
  }

  depends_on = [
    module.aoss,
  ]
}
