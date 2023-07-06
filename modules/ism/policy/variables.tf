variable "policy_id" {
  description = "The ID of the ISM policy"
  type        = string
}

variable "body" {
  description = "The JSON body of the ISM policy"
  type        = string
}

variable "create" {
  description = "If true, policy will be created"
  type        = bool
  default     = true
}

variable "index_pattern" {
  description = "Index pattern to update multiple indices at once"
  type        = string
}
