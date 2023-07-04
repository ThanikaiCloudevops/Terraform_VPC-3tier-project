module "private_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name = "private-bastion-sg"
  description = "it carrys inbound and outbound traffic for private bastion sg"

  vpc_id = module.vpc.vpc_id

  # ingress mean that inbound traffic for subnets
  ingress_rules = ["ssh-tcp","http-80-tcp"]

  ingress_cidr_blocks = ["0.0.0.0/0"]
  
  # outbound rules for private subnets
  egress_rules = ["all-all"]

  tags = local.common_tags
}