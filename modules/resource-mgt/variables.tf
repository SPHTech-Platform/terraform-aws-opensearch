variable "domain_endpoint" {
  description = "The endpoint of the OpenSearch cluster"
  type        = string
}

variable "ism_policies" {
  sensitive   = false
  description = "A map of all ISM policies to create. Value should be json encoded"
  type        = map(string)
  default     = {}
}

variable "ism_index_pattern" {
  description = "Index pattern to apply ISM policies to"
  type        = string
  default     = null
}
