resource "opensearch_dashboard_object" "index_pattern" {
  tenant_name = var.tenant_name
  body        = jsonencode(var.body)
}
