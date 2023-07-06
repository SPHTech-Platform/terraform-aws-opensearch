resource "opensearch_ism_policy" "this" {
  count = var.create ? 1 : 0

  policy_id = var.policy_id
  body      = var.body
}

resource "opensearch_ism_policy_mapping" "this" {
  policy_id = var.policy_id
  indexes   = var.index_pattern

  depends_on = [
    opensearch_ism_policy.this,
  ]
}
