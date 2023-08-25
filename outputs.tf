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
  value = { for key, sgr in aws_vpc_security_group_ingress_rule.main : key => sgr.id }
}

output "ingress_rules_arns" {
  value = { for key, sgr in aws_vpc_security_group_ingress_rule.main : key => sgr.arn }
}
