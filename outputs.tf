output "domain_arn" {
  description = "ARN of the OpenSearch Cluster"
  value       = aws_opensearch_domain.this.arn
}

output "domain_name" {
  description = "Name of the OpenSearch Cluster"
  value       = aws_opensearch_domain.this.domain_name
}

output "domain_id" {
  description = "Unique identifier for the Cluster"
  value       = aws_opensearch_domain.this.domain_id
}

output "domain_endpoint" {
  description = "Domain-specific endpoint used to submit index, search, and data upload requests"
  value       = aws_opensearch_domain.this.endpoint
}

output "vpc_endpoint_id" {
  description = "VPC endpoint ID"
  value       = var.create_vpc_endpoint ? aws_opensearch_vpc_endpoint.this[0].id : null
}

output "vpc_endpoint_dns_names" {
  description = "VPC endpoint DNS names"
  value       = var.create_vpc_endpoint ? [for entry in data.aws_vpc_endpoint.this[0].dns_entry : entry.dns_name] : []
}
