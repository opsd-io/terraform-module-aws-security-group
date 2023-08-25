resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

module "sg_test1" {
  source = "github.com/opsd-io/terraform-module-aws-security-group"

  vpc_id = aws_vpc.main.id
  # name   = "test-sg1"

  ingress_rules = {
    test = {
      cidr_ipv4   = "200.200.0.0/16"
      port_number = 443
    }
  }
}

module "sg_test2" {
  source = "github.com/opsd-io/terraform-module-aws-security-group"

  vpc_id = aws_vpc.main.id
  # name   = "test-sg1"

  ingress_rules = {
    test2 = {
      ip_protocol       = "all"
      security_group_id = module.sg_test1.id
    }
    self = {
      # ip_protocol       = "4"
      port_number = 80
      # from_port = 100
      # to_port   = 200
      security_group_id = module.sg_test2.id # self reference
    }
    L2TPaa = {
      ip_protocol       = "115"              # L2TP
      security_group_id = module.sg_test2.id # self reference
    }
    icmpv4 = {
      ip_protocol = "icmp"
      # icmp_type         = 3
      # icmp_code         = 7
      security_group_id = module.sg_test2.id # self reference
    }
    icmpv6 = {
      ip_protocol       = "58"
      icmp_type         = 1
      icmp_code         = 4
      security_group_id = module.sg_test2.id # self reference
    }
  }
}


output "sg_test1" {
  value = module.sg_test1
}

output "sg_test2" {
  value = module.sg_test2
}
