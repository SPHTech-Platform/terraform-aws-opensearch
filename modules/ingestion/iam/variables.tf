variable "pipeline_role_name" {
  description = "The name of the pipline IAM role"
  type        = string
}

variable "opensearch_domain_arns" {
  description = "(Optional) The ARN's of the OpenSearch domains to ingest data into"
  type        = list(string)
  default     = []
}

variable "custom_role_policy_arns" {
  description = "List of ARNs of IAM policies to attach to the pipeline IAM role"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
