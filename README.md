# Terraform Modules Template

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.aos](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_resource_policy.aos_log_publishing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_cloudwatch_metric_alarm.red_cluster_status](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_iam_service_linked_role.aos](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role) | resource |
| [aws_opensearch_domain.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain) | resource |
| [aws_opensearch_domain_saml_options.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain_saml_options) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.aos_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.aos_log_publishing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.combined](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | IAM policy document specifying the access policies for the domain | `string` | `""` | no |
| <a name="input_advanced_security_options_enabled"></a> [advanced\_security\_options\_enabled](#input\_advanced\_security\_options\_enabled) | Whether advanced security is enabled | `bool` | `false` | no |
| <a name="input_alarm_actions"></a> [alarm\_actions](#input\_alarm\_actions) | The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN) | `list(string)` | `[]` | no |
| <a name="input_anonymous_auth_enabled"></a> [anonymous\_auth\_enabled](#input\_anonymous\_auth\_enabled) | Whether Anonymous auth is enabled. Enables fine-grained access control on an existing domain. Ignored unless advanced\_security\_options are enabled. Can only be enabled on an existing domain | `bool` | `false` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | The number of availability zones for the OpenSearch cluster. Valid values: 1, 2 or 3. | `number` | `3` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the OpenSearch cluster. | `string` | n/a | yes |
| <a name="input_cold_storage_enabled"></a> [cold\_storage\_enabled](#input\_cold\_storage\_enabled) | Enable cold storage. Master and ultrawarm nodes must be enabled for cold storage. | `bool` | `false` | no |
| <a name="input_create_service_role"></a> [create\_service\_role](#input\_create\_service\_role) | Indicates whether to create the service-linked role. See https://docs.aws.amazon.com/opensearch-service/latest/developerguide/slr.html | `bool` | `false` | no |
| <a name="input_custom_endpoint"></a> [custom\_endpoint](#input\_custom\_endpoint) | Custom Endpoint URL | `string` | `null` | no |
| <a name="input_custom_endpoint_certificate_arn"></a> [custom\_endpoint\_certificate\_arn](#input\_custom\_endpoint\_certificate\_arn) | Custom Endpoint Certificate ARN | `string` | `null` | no |
| <a name="input_custom_endpoint_enabled"></a> [custom\_endpoint\_enabled](#input\_custom\_endpoint\_enabled) | custom endpoint enabled | `bool` | `false` | no |
| <a name="input_ebs_enabled"></a> [ebs\_enabled](#input\_ebs\_enabled) | Whether EBS volumes are attached to data nodes in the domain | `bool` | `false` | no |
| <a name="input_ebs_gp3_throughput"></a> [ebs\_gp3\_throughput](#input\_ebs\_gp3\_throughput) | Specifies the throughput (in MiB/s) of the EBS volumes attached to data nodes. Applicable only for the gp3 volume type. Valid values are between 125 and 1000 | `number` | `125` | no |
| <a name="input_ebs_iops"></a> [ebs\_iops](#input\_ebs\_iops) | Baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the GP3 and Provisioned IOPS EBS volume types | `number` | `3000` | no |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | Size of EBS volumes attached to data nodes (in GiB) | `number` | `10` | no |
| <a name="input_ebs_volume_type"></a> [ebs\_volume\_type](#input\_ebs\_volume\_type) | Type of EBS volumes attached to data nodes | `string` | `"gp3"` | no |
| <a name="input_encrypt_at_rest_enabled"></a> [encrypt\_at\_rest\_enabled](#input\_encrypt\_at\_rest\_enabled) | Enable encrypt at rest. | `bool` | `true` | no |
| <a name="input_encrypt_kms_key_id"></a> [encrypt\_kms\_key\_id](#input\_encrypt\_kms\_key\_id) | The KMS key ID to encrypt the OpenSearch cluster with. If not specified, then it defaults to using the AWS OpenSearch Service KMS key. | `string` | `null` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Specify the engine version for the Amazon OpenSearch Service domain | `string` | `"OpenSearch_1.3"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | The number of dedicated hot nodes in the cluster. | `number` | `3` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of EC2 instances to run for each hot node. A list of available instance types can you find at https://aws.amazon.com/en/opensearch-service/pricing/#On-Demand_instance_pricing | `string` | `"t3.small.search"` | no |
| <a name="input_internal_user_database_enabled"></a> [internal\_user\_database\_enabled](#input\_internal\_user\_database\_enabled) | Whether the internal user database is enabled | `bool` | `false` | no |
| <a name="input_log_publishing_options"></a> [log\_publishing\_options](#input\_log\_publishing\_options) | Configuration block for publishing slow and application logs to CloudWatch Logs. | <pre>map(object({<br>    enabled                  = optional(bool, true)<br>    cloudwatch_log_group_arn = optional(string, "")<br>  }))</pre> | `{}` | no |
| <a name="input_master_instance_count"></a> [master\_instance\_count](#input\_master\_instance\_count) | The number of dedicated master nodes in the cluster. | `number` | `3` | no |
| <a name="input_master_instance_enabled"></a> [master\_instance\_enabled](#input\_master\_instance\_enabled) | Indicates whether dedicated master nodes are enabled for the cluster. | `bool` | `true` | no |
| <a name="input_master_instance_type"></a> [master\_instance\_type](#input\_master\_instance\_type) | The type of EC2 instances to run for each master node. A list of available instance types can you find at https://aws.amazon.com/en/opensearch-service/pricing/#On-Demand_instance_pricing | `string` | `"t3.small.search"` | no |
| <a name="input_master_user_arn"></a> [master\_user\_arn](#input\_master\_user\_arn) | The ARN for the master user of the cluster. If not specified, then it defaults to using the IAM user that is making the request. | `string` | `""` | no |
| <a name="input_master_user_name"></a> [master\_user\_name](#input\_master\_user\_name) | Main user's username, which is stored in the Amazon OpenSearch Service domain's internal database | `string` | `""` | no |
| <a name="input_master_user_password"></a> [master\_user\_password](#input\_master\_user\_password) | Main user's password, which is stored in the Amazon OpenSearch Service domain's internal database | `string` | `""` | no |
| <a name="input_node_to_node_encryption_enabled"></a> [node\_to\_node\_encryption\_enabled](#input\_node\_to\_node\_encryption\_enabled) | Enable node-to-node encryption. | `bool` | `true` | no |
| <a name="input_ok_actions"></a> [ok\_actions](#input\_ok\_actions) | The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN) | `list(string)` | `[]` | no |
| <a name="input_red_cluster_status_evaluation_periods"></a> [red\_cluster\_status\_evaluation\_periods](#input\_red\_cluster\_status\_evaluation\_periods) | The number of periods over which data is compared to the specified threshold | `number` | `1` | no |
| <a name="input_red_cluster_status_period"></a> [red\_cluster\_status\_period](#input\_red\_cluster\_status\_period) | The period in seconds over which the specified statistic is applied | `number` | `60` | no |
| <a name="input_red_cluster_status_threshold"></a> [red\_cluster\_status\_threshold](#input\_red\_cluster\_status\_threshold) | The value against which the specified statistic is compared. This parameter is required for alarms based on static thresholds, but should not be used for alarms based on anomaly detection models | `number` | `1` | no |
| <a name="input_saml_enabled"></a> [saml\_enabled](#input\_saml\_enabled) | Whether SAML authentication is enabled | `bool` | `false` | no |
| <a name="input_saml_entity_id"></a> [saml\_entity\_id](#input\_saml\_entity\_id) | The unique Entity ID of the application in SAML Identity Provider. | `string` | `""` | no |
| <a name="input_saml_master_backend_role"></a> [saml\_master\_backend\_role](#input\_saml\_master\_backend\_role) | This backend role receives full permissions to the cluster, equivalent to a new master role, but can only use those permissions within Dashboards. | `string` | `null` | no |
| <a name="input_saml_master_user_name"></a> [saml\_master\_user\_name](#input\_saml\_master\_user\_name) | This username receives full permissions to the cluster, equivalent to a new master user, but can only use those permissions within Dashboards. | `string` | `null` | no |
| <a name="input_saml_metadata_content"></a> [saml\_metadata\_content](#input\_saml\_metadata\_content) | The metadata of the SAML application in xml format. | `string` | `""` | no |
| <a name="input_saml_options_enabled"></a> [saml\_options\_enabled](#input\_saml\_options\_enabled) | Whether SAML authentication options for an AWS OpenSearch Domain is enabled | `bool` | `false` | no |
| <a name="input_saml_roles_key"></a> [saml\_roles\_key](#input\_saml\_roles\_key) | Element of the SAML assertion to use for backend roles. | `string` | `""` | no |
| <a name="input_saml_session_timeout"></a> [saml\_session\_timeout](#input\_saml\_session\_timeout) | Duration of a session in minutes after a user logs in. Default is 60. Maximum value is 1,440. | `number` | `60` | no |
| <a name="input_saml_subject_key"></a> [saml\_subject\_key](#input\_saml\_subject\_key) | Element of the SAML assertion to use for username. | `string` | `""` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of VPC Security Group IDs to be applied to the OpenSearch domain endpoints. If omitted, the default Security Group for the VPC will be used | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of VPC Subnet IDs for the OpenSearch domain endpoints to be created in | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_warm_instance_count"></a> [warm\_instance\_count](#input\_warm\_instance\_count) | The number of dedicated warm nodes in the cluster. | `number` | `3` | no |
| <a name="input_warm_instance_enabled"></a> [warm\_instance\_enabled](#input\_warm\_instance\_enabled) | Indicates whether ultrawarm nodes are enabled for the cluster. | `bool` | `false` | no |
| <a name="input_warm_instance_type"></a> [warm\_instance\_type](#input\_warm\_instance\_type) | The type of EC2 instances to run for each warm node. A list of available instance types can you find at https://aws.amazon.com/en/elasticsearch-service/pricing/#UltraWarm_pricing | `string` | `"ultrawarm1.medium.search"` | no |
| <a name="input_whitelist_ips"></a> [whitelist\_ips](#input\_whitelist\_ips) | Whitelisted client ip address to access. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | ARN of the OpenSearch Cluster |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Domain-specific endpoint used to submit index, search, and data upload requests |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | Unique identifier for the Cluster |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of the OpenSearch Cluster |
| <a name="output_kibana_endpoint"></a> [kibana\_endpoint](#output\_kibana\_endpoint) | Domain-specific endpoint for kibana without https scheme. |
<!-- END_TF_DOCS -->
