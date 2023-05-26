variable "domain_name" {
  description = "The name of the OpenSearch cluster"
  type        = string
}

variable "pipeline_name" {
  description = "Name of the ingestion pipeline"
  type        = string
  default     = null
}

variable "pipeline_role_name" {
  description = "Name of the pipeline role to use"
  type        = string
}

variable "pipeline_configuration_body" {
  description = "The Data Prepper pipeline configuration in YAML format"
  type        = string
}

variable "pipeline_min_units" {
  description = "The minimum pipeline capacity, in Ingestion Compute Units"
  type        = number
}

variable "pipeline_max_units" {
  description = "The maximum pipeline capacity, in Ingestion Compute Units"
  type        = number
}

variable "pipeline_enable_logging" {
  description = "If true, will create a cloudwatch log group to monitor the pipeline"
  type        = bool
  default     = true
}

variable "pipeline_log_group_retention_days" {
  description = "Duration in days for cloudwatch log group retention"
  type        = number
  default     = 30
}

####################
# VPC Configuration
####################

variable "vpc_pipeline" {
  description = "Set to true if pipeline is configured as a VPC pipeline, else it will be a public one"
  type        = bool
  default     = false
}

variable "subnet_ids" {
  description = "List of subnet IDs associated with the pipeline"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "List of security groups associated with the pipeline"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
