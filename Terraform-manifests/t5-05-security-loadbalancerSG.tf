module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name = "${local.Env}load-balancer"
  description = "This is load-balancer security groups "
  vpc_id = module.vpc.vpc_id
  # ingress blocks

  ingress_rules = [ "http-80-tcp","https-443-tcp"]
  ingress_cidr_blocks = [ "0.0.0.0/0" ]

  # egress blocks
  egress_rules = [ "all-all" ]
  ingress_with_cidr_blocks = [
    {
      from_port   = 81
      to_port     = 81
      protocol    = "tcp"
      description = "This allows port 80 "
      cidr_blocks = "0.0.0.0/0"
    }
]

}