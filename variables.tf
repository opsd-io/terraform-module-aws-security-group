variable "common_tags" {
  description = "A map of tags to assign to every resource in this module."
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "The ID of the VPC."
  nullable    = false
  type        = string
}

variable "name" {
  description = "Name of the security group."
  type        = string
  default     = null
}

variable "description" {
  description = "Security group description."
  type        = string
  default     = null
}

variable "ingress_rules" {
  description = "Inbound rules (ingress) for this security group."
  nullable    = false
  type = map(object({
    description = optional(string, null)
    ip_protocol = optional(string, "tcp")

    port_number = optional(number, null)
    from_port   = optional(number, null)
    to_port     = optional(number, null)

    icmp_type = optional(number, null)
    icmp_code = optional(number, null)

    cidr_ipv4         = optional(string, null)
    cidr_ipv6         = optional(string, null)
    prefix_list_id    = optional(string, null)
    security_group_id = optional(string, null)
    extra_tags        = optional(map(string), {})
  }))
  default = {
    # "icmp-in" = {
    #   ip_protocol = "icmp"
    #   cidr_ipv4   = "0.0.0.0/0"
    # }
    # "ssh-in" = {
    #   cidr_ipv4   = "0.0.0.0/0"
    #   port_number = 22
    # }
  }
}

variable "egress_rules" {
  description = "Outbound rules (egress) for this security group."
  nullable    = false
  type = map(object({
    description = optional(string, null)
    ip_protocol = optional(string, "tcp")

    port_number = optional(number, null)
    from_port   = optional(number, null)
    to_port     = optional(number, null)

    icmp_type = optional(number, null)
    icmp_code = optional(number, null)

    cidr_ipv4         = optional(string, null)
    cidr_ipv6         = optional(string, null)
    prefix_list_id    = optional(string, null)
    security_group_id = optional(string, null)
    extra_tags        = optional(map(string), {})
  }))
  default = {
    # "allow-all" = {
    #   ip_protocol = "all"
    #   cidr_ipv4   = "0.0.0.0/0"
    # }
  }
}
