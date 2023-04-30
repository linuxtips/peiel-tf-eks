## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.65.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.65.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | ~> 19.0 |

## Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_subnets.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | n/a | `string` | `""` | no |
| <a name="input_aws_account"></a> [aws\_account](#input\_aws\_account) | n/a | `list(string)` | <pre>[<br>  296686755935<br>]</pre> | no |
| <a name="input_aws_iam_access_key"></a> [aws\_iam\_access\_key](#input\_aws\_iam\_access\_key) | n/a | `string` | `null` | no |
| <a name="input_aws_iam_secret_key"></a> [aws\_iam\_secret\_key](#input\_aws\_iam\_secret\_key) | n/a | `string` | `null` | no |
| <a name="input_default_instance_size"></a> [default\_instance\_size](#input\_default\_instance\_size) | n/a | `list(string)` | <pre>[<br>  "t3.medium"<br>]</pre> | no |
| <a name="input_eks_version"></a> [eks\_version](#input\_eks\_version) | n/a | `string` | `"1.25"` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | `""` | no |
| <a name="input_ng_desired_size"></a> [ng\_desired\_size](#input\_ng\_desired\_size) | n/a | `number` | `2` | no |
| <a name="input_ng_max_size"></a> [ng\_max\_size](#input\_ng\_max\_size) | n/a | `number` | `2` | no |
| <a name="input_ng_min_size"></a> [ng\_min\_size](#input\_ng\_min\_size) | n/a | `number` | `1` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-west-2"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | n/a | `list(string)` | `""` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | `""` | no |

## Outputs

No outputs.
