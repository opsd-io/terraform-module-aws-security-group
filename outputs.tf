output "id" {
  description = "The ID of the security group."
  value       = aws_security_group.main.id
}

output "arn" {
  description = "The ARN of the security group."
  value       = aws_security_group.main.arn
}

output "name" {
  description = "The name of the security group."
  value       = aws_security_group.main.name
}

output "ingress_rules_ids" {
  description = "The IDs of the security group ingress rules."
  value = {
    for key, sgr in aws_vpc_security_group_ingress_rule.main : key => sgr.id
  }
}

output "ingress_rules_arns" {
  description = "The ARNs of the security group ingress rules."
  value = {
    for key, sgr in aws_vpc_security_group_ingress_rule.main : key => sgr.arn
  }
}

output "egress_rules_ids" {
  description = "The IDs of the security group egress rules."
  value = {
    for key, sgr in aws_vpc_security_group_egress_rule.main : key => sgr.id
  }
}

output "egress_rules_arns" {
  description = "The ARNs of the security group egress rules."
  value = {
    for key, sgr in aws_vpc_security_group_egress_rule.main : key => sgr.arn
  }
}
