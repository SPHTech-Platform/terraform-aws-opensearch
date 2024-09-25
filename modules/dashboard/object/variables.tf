variable "tenant_name" {
  description = "The name of the tenant to which dashboard data associates. Empty string defaults to global tenant"
  type        = string
  default     = ""
}

variable "body" {
  description = "The dashboard document in JSON or HCL"
  type        = any
}
