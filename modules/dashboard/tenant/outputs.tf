output "id" {
  description = "The ID of the dashboard tenant"
  value       = opensearch_dashboard_tenant.this.id
}

output "name" {
  description = "The name of the dashboard tenant"
  value       = opensearch_dashboard_tenant.this.tenant_name
}
