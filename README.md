<a href="https://www.opsd.io" target="_blank"><img alt="OPSd" src=".github/img/OPSD_logo.svg" width="180px"></a>

Meet **OPSd**. The unique and effortless way of managing cloud infrastructure.

# terraform-module-template

## Introduction

What does the module provide?

## Usage

```hcl
module "module_name" {
  source  = "github.com/opsd-io/module_name?ref=v0.0.1"

  # Variables
  variable_1 = "foo"
  variable_2 = "bar"
}
```

**IMPORTANT**: Make sure not to pin to master because there may be breaking changes between releases.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_security_group_egress_rule.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to assign to every resource in this module. | `map(string)` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | Security group description. | `string` | `null` | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | Outbound rules (egress) for this security group. | <pre>map(object({<br>    description = optional(string, null)<br>    ip_protocol = optional(string, "tcp")<br><br>    port_number = optional(number, null)<br>    from_port   = optional(number, null)<br>    to_port     = optional(number, null)<br><br>    icmp_type = optional(number, null)<br>    icmp_code = optional(number, null)<br><br>    cidr_ipv4         = optional(string, null)<br>    cidr_ipv6         = optional(string, null)<br>    prefix_list_id    = optional(string, null)<br>    security_group_id = optional(string, null)<br>    extra_tags        = optional(map(string), {})<br>  }))</pre> | `{}` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | Inbound rules (ingress) for this security group. | <pre>map(object({<br>    description = optional(string, null)<br>    ip_protocol = optional(string, "tcp")<br><br>    port_number = optional(number, null)<br>    from_port   = optional(number, null)<br>    to_port     = optional(number, null)<br><br>    icmp_type = optional(number, null)<br>    icmp_code = optional(number, null)<br><br>    cidr_ipv4         = optional(string, null)<br>    cidr_ipv6         = optional(string, null)<br>    prefix_list_id    = optional(string, null)<br>    security_group_id = optional(string, null)<br>    extra_tags        = optional(map(string), {})<br>  }))</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the security group. | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the security group. |
| <a name="output_egress_rules_arns"></a> [egress\_rules\_arns](#output\_egress\_rules\_arns) | The ARNs of the security group egress rules. |
| <a name="output_egress_rules_ids"></a> [egress\_rules\_ids](#output\_egress\_rules\_ids) | The IDs of the security group egress rules. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the security group. |
| <a name="output_ingress_rules_arns"></a> [ingress\_rules\_arns](#output\_ingress\_rules\_arns) | The ARNs of the security group ingress rules. |
| <a name="output_ingress_rules_ids"></a> [ingress\_rules\_ids](#output\_ingress\_rules\_ids) | The IDs of the security group ingress rules. |
| <a name="output_name"></a> [name](#output\_name) | The name of the security group. |
<!-- END_TF_DOCS -->

## Examples of usage

Do you want to see how the module works? See all the [usage examples](examples).

## Related modules

The list of related modules (if present).

## Contributing

If you are interested in contributing to the project, see see our [guide](https://github.com/opsd-io/contribution).

## Support

If you have a problem with the module or want to propose a new feature, you can report it via the project's (Github) issue tracker.

If you want to discuss something in person, you can join our community on [Slack](https://join.slack.com/t/opsd-community/signup).

## License

[Apache License 2.0](LICENSE)
