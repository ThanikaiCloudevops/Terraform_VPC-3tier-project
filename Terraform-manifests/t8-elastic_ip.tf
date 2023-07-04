# eip elactic ip associate with bastion host

resource "aws_eip" "elatic-ip" {

  depends_on = [ module.public-ec2-instance,module.vpc ]
  instance = module.public-ec2-instance.id
  domain   = "vpc"


  tags = local.common_tags
  
}