resource "opensearch_dashboard_object" "this" {
  tenant_name = var.tenant_name
  body        = jsonencode(var.body)
}
