output "id" {
  description = "ID of the Opensearch Collection"
  value       = module.aoss.id
}

output "arn" {
  description = "ARN of the Opensearch Collection"
  value       = module.aoss.arn
}

output "endpoint" {
  description = "Collection-specific endpoint used to submit index, search, and data upload requests to an OpenSearch Serverless collection"
  value       = module.aoss.endpoint
}

output "dashboard_endpoint" {
  description = "Collection-specific endpoint used to access OpenSearch Dashboards"
  value       = module.aoss.dashboard_endpoint
}

output "vpc_endpoint_id" {
  description = "VPC endpoint ID for the OpenSearch collection"
  value       = var.create_vpc_endpoint ? aws_opensearchserverless_vpc_endpoint.this[0].id : null
}
