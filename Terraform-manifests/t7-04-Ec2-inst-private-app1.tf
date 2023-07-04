# private instance for out web app

module "private-ec2-instance-app1" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.1.0"

  # for_each = toset(["one", "two"])


  name = "private-${local.Business}-app1"
  ami                    = data.aws_ami.Demo-ec2.id

  instance_type          = var.type_instance
  key_name               = var.instance_key
#   monitoring             = true
  vpc_security_group_ids = [module.bastion_security_group.security_group_id]
  subnet_ids              = "${module.vpc.private_subnets}"
  # "${module.vpc.private_subnets[0]}"
  # count = var.vm_number
  # instance_count = 3

  user_data = file("${path.module}/app1-install.sh")

  tags = local.common_tags
}
