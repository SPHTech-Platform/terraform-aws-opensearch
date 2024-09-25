variable "pattern" {
  description = "The index pattern"
  type        = string
  default     = "test-pattern-*"
}

variable "pattern_id" {
  description = "The ID of index pattern"
  type        = string
  default     = "test"
}

variable "time_field_name" {
  description = "Field name which has the timestamp"
  type        = string
  default     = "timestamp"
}
