output "id" {
  description = "The ID of the index template"
  value       = try(opensearch_ism_policy.this[0].id, "")
}
