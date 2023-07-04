module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  
  #Name of vpc represent here:
  name = "${local.Business}"


  # Range of ip using Cidr blocks
  cidr = var.cidr_blocks
  azs = var.availiablity_zones

  # subnets details 

  public_subnets = var.public_subnet
  private_subnets =var.priavte_subnet

  database_subnets = var.database_subnet
  create_database_subnet_group = var.create_database_group
  create_database_subnet_route_table = var.create_database_route_table

  enable_dns_hostnames = true
  enable_dns_support = true


  # nat_gateway for private subnets inside the ec2 instance
  enable_nat_gateway = var.assign_nat_gateway
  single_nat_gateway = var.single_nat_gateway

 # tags blocks
  public_subnet_tags = {
    type = "public_subnets"
  }

  private_subnet_tags = {
    type = "private_subnets"
  }

  database_subnet_tags = {
    type = "database_subnets"
  }

  tags = local.common_tags

  vpc_tags = {
    name = "My_vpc"
  }



}
