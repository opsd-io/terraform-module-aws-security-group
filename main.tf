terraform {
  required_version = ">= 1.3.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_security_group" "main" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  revoke_rules_on_delete = true

  tags = merge(var.common_tags, {
    Name = var.name
  })

  lifecycle {
    create_before_destroy = true
  }
}


locals {
  port_protocol = ["6", "tcp", "17", "udp"]
  icmp_protocol = ["1", "icmp", "58", "icmpv6"]
}

resource "aws_vpc_security_group_ingress_rule" "main" {
  for_each = var.ingress_rules

  security_group_id = aws_security_group.main.id
  description       = each.value.description

  ip_protocol = each.value.ip_protocol

  # If the protocol is TCP or UDP, this is the start of the port range.
  # If the protocol is ICMP or ICMPv6, this is the type number.
  # A value of -1 indicates all ICMP/ICMPv6 types.
  # Null is used for all other protocols.
  from_port = (
    contains(local.port_protocol, lower(each.value.ip_protocol)) ? coalesce(each.value.port_number, each.value.from_port, 0) : (
      contains(local.icmp_protocol, lower(each.value.ip_protocol)) ? coalesce(each.value.icmp_type, -1) :
      null
    )
  )

  # If the protocol is TCP or UDP, this is the end of the port range.
  # If the protocol is ICMP or ICMPv6, this is the code number.
  # A value of -1 indicates all ICMP/ICMPv6 codes.
  # Null is used for all other protocols.
  to_port = (
    contains(local.port_protocol, lower(each.value.ip_protocol)) ? coalesce(each.value.port_number, each.value.to_port, 65535) : (
      contains(local.icmp_protocol, lower(each.value.ip_protocol)) ? coalesce(each.value.icmp_code, -1) :
      null
    )
  )

  cidr_ipv4                    = each.value.cidr_ipv4
  cidr_ipv6                    = each.value.cidr_ipv6
  prefix_list_id               = each.value.prefix_list_id
  referenced_security_group_id = each.value.security_group_id

  tags = merge(var.common_tags, each.value.extra_tags, {
    Name = each.key
  })
}

# resource "aws_vpc_security_group_egress_rule" "main" {
#   for_each = var.egress_rules
#   security_group_id = aws_security_group.main.id

#   cidr_ipv4   = "10.0.0.0/8"
#   from_port   = 80
#   ip_protocol = "tcp"
#   to_port     = 80
# }
