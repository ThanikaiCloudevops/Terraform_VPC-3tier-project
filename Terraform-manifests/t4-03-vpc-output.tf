#output of vpc resource
output "vpc_id" {
    description = "Output the vpc_id"
    value = module.vpc.vpc_id
  
}
#cidr
output "cidr_block" {
    description = "its will show cidr range"
    value = module.vpc.vpc_cidr_block
  
}

#public subnets

output "public_subnet_ip" {
    description = "it will show public ip details"
    value = module.vpc.public_subnets
  
}
# private subnets
output "private_subnet_ip" {
    description = "its will shows private ip for refers"
    value = module.vpc.private_subnets
  
}
# database subnets
output "database_subnet_ip" {
    description = "its database ip for our refers"
    value = module.vpc.database_subnets
  
}
#az -zones
output "availability" {
    description = "which zones our resource details"
    value = module.vpc.azs
  
}
# nat_gateway ip details
output "nat_ip" {
    description = "nat_gateway ip address"
    value = module.vpc.nat_public_ips
  
}