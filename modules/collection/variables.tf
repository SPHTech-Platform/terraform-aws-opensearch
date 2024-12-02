variable "name" {
  type        = string
  description = "Name of the OpenSearch Serverless collection."
}

variable "collection_type" {
  type        = string
  description = "Type of collection. Possible values are `SEARCH`, `TIMESERIES` or `VECTORSEARCH`"
}

variable "description" {
  type        = string
  description = "Description for the OpenSearch Serverless collection."
}

variable "allow_public_access" {
  type        = bool
  description = "Whether public access is to be given"
  default     = false
}

variable "vpc_id" {
  description = "VPC ID to deploy the cluster into. Need only if the VPC endpoint created."
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "Subnet IDs in which the VPC endpoint is created. Needed only if `create_vpc_endpoint` is true"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "Security group IDs attached to the VPC endpoint. Needed only if `create_vpc_endpoint` is true"
  type        = list(string)
  default     = []
}

variable "create_vpc_endpoint" {
  type        = bool
  description = "Whether a VPC endpoint is to be created for the collection"
  default     = false
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

###########
# Policies
###########
variable "create_encryption_policy" {
  description = "Determines whether an encryption policy will be created"
  type        = bool
  default     = true
}

variable "encryption_kms_arn" {
  description = "Encryption policy to apply to the collection"
  type        = string
  default     = null
}

variable "create_network_policy" {
  description = "Determines whether an network policy will be created"
  type        = bool
  default     = true
}

variable "create_access_policy" {
  description = "Determines whether an access policy will be created"
  type        = bool
  default     = true
}

variable "access_policy_index_permissions" {
  description = "Access policy permissions for the collection index"
  type        = list(string)
  default     = ["aoss:*"]
}

variable "access_policy_collection_permissions" {
  description = "Access policy permissions for the collection"
  type        = list(string)
  default     = ["aoss:*"]
}

variable "access_policy_principals" {
  description = "Access policy principals"
  type        = list(string)
  default     = []
}

variable "access_policy" {
  description = "Access policy to apply to the collection"
  type        = any
  default     = {}
}

variable "create_lifecycle_policy" {
  description = "Determines whether an lifecycle policy will be created"
  type        = bool
  default     = false
}

variable "lifecycle_policy_min_index_retention" {
  description = "The minimum period, in days (d) or hours (h), to retain the document in the index. The lower bound is `24h` and the upper bound is `3650d`"
  type        = string
  default     = null
}

variable "lifecycle_policy_no_min_index_retention" {
  description = "If true, OpenSearch Serverless retains documents indefinitely"
  type        = bool
  default     = null
}
