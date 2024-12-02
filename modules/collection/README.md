## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.15 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.15 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aoss"></a> [aoss](#module\_aoss) | terraform-aws-modules/opensearch/aws//modules/collection | ~> 1.5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_opensearchserverless_vpc_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearchserverless_vpc_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_policy"></a> [access\_policy](#input\_access\_policy) | Access policy to apply to the collection | `any` | `{}` | no |
| <a name="input_access_policy_collection_permissions"></a> [access\_policy\_collection\_permissions](#input\_access\_policy\_collection\_permissions) | Access policy permissions for the collection | `list(string)` | <pre>[<br/>  "aoss:*"<br/>]</pre> | no |
| <a name="input_access_policy_index_permissions"></a> [access\_policy\_index\_permissions](#input\_access\_policy\_index\_permissions) | Access policy permissions for the collection index | `list(string)` | <pre>[<br/>  "aoss:*"<br/>]</pre> | no |
| <a name="input_access_policy_principals"></a> [access\_policy\_principals](#input\_access\_policy\_principals) | Access policy principals | `list(string)` | `[]` | no |
| <a name="input_allow_public_access"></a> [allow\_public\_access](#input\_allow\_public\_access) | Whether public access is to be given | `bool` | `false` | no |
| <a name="input_collection_type"></a> [collection\_type](#input\_collection\_type) | Type of collection. Possible values are `SEARCH`, `TIMESERIES` or `VECTORSEARCH` | `string` | n/a | yes |
| <a name="input_create_access_policy"></a> [create\_access\_policy](#input\_create\_access\_policy) | Determines whether an access policy will be created | `bool` | `true` | no |
| <a name="input_create_encryption_policy"></a> [create\_encryption\_policy](#input\_create\_encryption\_policy) | Determines whether an encryption policy will be created | `bool` | `true` | no |
| <a name="input_create_lifecycle_policy"></a> [create\_lifecycle\_policy](#input\_create\_lifecycle\_policy) | Determines whether an lifecycle policy will be created | `bool` | `false` | no |
| <a name="input_create_network_policy"></a> [create\_network\_policy](#input\_create\_network\_policy) | Determines whether an network policy will be created | `bool` | `true` | no |
| <a name="input_create_vpc_endpoint"></a> [create\_vpc\_endpoint](#input\_create\_vpc\_endpoint) | Whether a VPC endpoint is to be created for the collection | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for the OpenSearch Serverless collection. | `string` | n/a | yes |
| <a name="input_encryption_kms_arn"></a> [encryption\_kms\_arn](#input\_encryption\_kms\_arn) | Encryption policy to apply to the collection | `string` | `null` | no |
| <a name="input_lifecycle_policy_min_index_retention"></a> [lifecycle\_policy\_min\_index\_retention](#input\_lifecycle\_policy\_min\_index\_retention) | The minimum period, in days (d) or hours (h), to retain the document in the index. The lower bound is `24h` and the upper bound is `3650d` | `string` | `null` | no |
| <a name="input_lifecycle_policy_no_min_index_retention"></a> [lifecycle\_policy\_no\_min\_index\_retention](#input\_lifecycle\_policy\_no\_min\_index\_retention) | If true, OpenSearch Serverless retains documents indefinitely | `bool` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the OpenSearch Serverless collection. | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Security group IDs attached to the VPC endpoint. Needed only if `create_vpc_endpoint` is true | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet IDs in which the VPC endpoint is created. Needed only if `create_vpc_endpoint` is true | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to deploy the cluster into. Need only if the VPC endpoint created. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the Opensearch Collection |
| <a name="output_dashboard_endpoint"></a> [dashboard\_endpoint](#output\_dashboard\_endpoint) | Collection-specific endpoint used to access OpenSearch Dashboards |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Collection-specific endpoint used to submit index, search, and data upload requests to an OpenSearch Serverless collection |
| <a name="output_id"></a> [id](#output\_id) | ID of the Opensearch Collection |
| <a name="output_vpc_endpoint_id"></a> [vpc\_endpoint\_id](#output\_vpc\_endpoint\_id) | VPC endpoint ID for the OpenSearch collection |
