resource "opensearch_dashboard_object" "this" {
  tenant_name = var.tenant_name
  body        = var.body
}
