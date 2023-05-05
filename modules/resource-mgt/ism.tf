resource "elasticsearch_opensearch_ism_policy" "this" {
  for_each = nonsensitive(var.ism_policies)

  policy_id = each.key
  body      = each.value
}

resource "elasticsearch_opensearch_ism_policy_mapping" "this" {
  count = length(elasticsearch_opensearch_ism_policy.this)

  policy_id = elasticsearch_opensearch_ism_policy.this[count.index].id
  indexes   = var.ism_index_pattern
}
