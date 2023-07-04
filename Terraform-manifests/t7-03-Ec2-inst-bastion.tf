# bastion EC2 instane act like jump box

module "public-ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.1.0"

  name = "bastion-${local.Business}"

  instance_type          = var.type_instance
  key_name               = var.instance_key
#   monitoring             = true
  vpc_security_group_ids = [module.bastion_security_group.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = local.common_tags
}
