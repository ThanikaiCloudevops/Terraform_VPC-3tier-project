#security groups for outbound and inbound traffic for public subnets
module "bastion_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name = "public-bastion-sg"
  description = "it carrys inbound and outbound traffic for public bastion sg"

  vpc_id = module.vpc.vpc_id

  # ingress mean that inbound traffic for subnets
  ingress_rules = ["ssh-tcp"]

  ingress_cidr_blocks = ["0.0.0.0/0"]
  
  # outbound rules for public subnets
  egress_rules = ["all-all"]

  tags = local.common_tags





}