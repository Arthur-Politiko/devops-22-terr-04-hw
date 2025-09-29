## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.8.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.develop](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.develop](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `"Dummy module just for VPC and Subnets"` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | 
Environment name for labeling | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | for dynamic block 'labels' | `map(string)` | `{}` | no |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | VPC network ID | `string` | `null` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | VPC network name | `string` | `null` | no |
| <a name="input_service_account_id"></a> [service\_account\_id](#input\_service\_account\_id) | Service account ID | `string` | `null` | no |
| <a name="input_subnet_cidrs"></a> [subnet\_cidrs](#input\_subnet\_cidrs) | List of subnet IDs | `list(string)` | `[]` | no |    
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | List of subnet names | `list(string)` | `[]` | no |  
| <a name="input_subnet_zones"></a> [subnet\_zones](#input\_subnet\_zones) | List of zones for subnetworks | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network"></a> [network](#output\_network) | n/a |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | n/a |