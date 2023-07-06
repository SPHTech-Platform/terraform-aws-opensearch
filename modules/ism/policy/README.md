## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_opensearch"></a> [opensearch](#requirement\_opensearch) | ~> 1.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_opensearch"></a> [opensearch](#provider\_opensearch) | ~> 1.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [opensearch_ism_policy.this](https://registry.terraform.io/providers/opensearch-project/opensearch/latest/docs/resources/ism_policy) | resource |
| [opensearch_ism_policy_mapping.this](https://registry.terraform.io/providers/opensearch-project/opensearch/latest/docs/resources/ism_policy_mapping) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_body"></a> [body](#input\_body) | The JSON body of the ISM policy | `string` | n/a | yes |
| <a name="input_create"></a> [create](#input\_create) | If true, policy will be created | `bool` | `true` | no |
| <a name="input_index_pattern"></a> [index\_pattern](#input\_index\_pattern) | Index pattern to update multiple indices at once | `string` | n/a | yes |
| <a name="input_policy_id"></a> [policy\_id](#input\_policy\_id) | The ID of the ISM policy | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the index template |
