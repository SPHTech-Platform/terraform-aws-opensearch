resource "aws_kms_key" "objects" {
  #checkov:skip=CKV2_AWS_64:Ensure KMS key Policy is defined
  description             = "KMS key is used to encrypt node data"
  deletion_window_in_days = 7
  is_enabled              = true
  enable_key_rotation     = true
}

resource "aws_cloudwatch_log_group" "opensearch" {
  #checkov:skip=CKV_AWS_317:Ensure Elasticsearch Domain Audit Logging is enabled
  #checkov:skip=CKV_AWS_338:Ensure CloudWatch log groups retains logs for at least 1 year
  name              = "os-log-group"
  retention_in_days = 30
  kms_key_id        = aws_kms_key.objects.id
}

resource "aws_cloudwatch_log_resource_policy" "opensearch" {
  policy_name = "os-log-policy"

  policy_document = data.aws_iam_policy_document.log_publish_policy.json
}

module "opensearch" {
  source = "../../"

  domain_name    = var.domain_name
  engine_version = var.engine_version

  create_service_role = false

  instance_count = var.instance_count
  instance_type  = var.instance_type

  ebs_enabled = true
  ebs_iops    = 5000

  subnet_ids = [
    data.aws_cloudformation_export.web_subnet_a.value,
    data.aws_cloudformation_export.web_subnet_b.value,
  ]

  security_group_ids = [
    data.aws_cloudformation_export.app_sg_id.value,
  ]

  # VPC endpoint creation. Disabled by default
  create_vpc_endpoint = true
  vpc_endpoint_subnet_ids = [
    data.aws_cloudformation_export.web_subnet_a.value,
    data.aws_cloudformation_export.web_subnet_b.value,
    data.aws_cloudformation_export.web_subnet_c.value,
  ]
  vpc_endpoint_security_group_ids = [
    data.aws_cloudformation_export.app_sg_id.value,
  ]

  node_to_node_encryption_enabled = true
  encrypt_at_rest_enabled         = true
  encrypt_kms_key_id              = aws_kms_key.objects.id

  log_publishing_options = {
    audit_logs = {
      enabled = true
    }
    index_slow_logs = {
      enabled = false
    }
  }

  tags = {
    Domain = "TestDomain"
    Name   = var.domain_name
  }
}
