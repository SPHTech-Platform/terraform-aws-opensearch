module "pipeline_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role"
  version = "~> 6.2.0"

  name            = var.pipeline_role_name
  description     = "IAM Role to be assumed by Opensearch ingestion pipeline"
  use_name_prefix = false

  trust_policy_permissions = {
    TrustedServices = {
      actions = [
        "sts:AssumeRole",
        "sts:TagSession",
      ]
      principals = [
        {
          type        = "Service"
          identifiers = ["osis-pipelines.amazonaws.com"]
        }
      ]
    }
  }

  policies = {
    OpensearchAccess = module.pipeline_opensearch_policy.arn
  }

  tags = var.tags
}

module "pipeline_opensearch_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 6.2.0"

  create = local.create_opensearch_ingestion_policy

  name        = "${var.pipeline_role_name}-ingestion-policy"
  path        = "/"
  description = "IAM Policy for Opensearch ingestion"
  policy      = data.aws_iam_policy_document.opensearch_ingestion.json

  tags = var.tags
}
