# security group id ,security group name ,security vpc group id
output "public_sg" {
    description = "tell us bastion sg id"
    value = module.bastion_security_group.security_group_id
  
}

output "public_sg_ip" {
    description = "tell us bastion sg ip"
    value = module.bastion_security_group.security_group_name
  
}

output "public_sd_vpc_id" {
    description = "vpc_sg-ip details"
    value = module.bastion_security_group.security_group_vpc_id
  
}
output "private_sg" {
    description = "tell us private sg id"
    value = module.private_security_group.security_group_id
  
}

output "private_sg_ip" {
    description = "tell us private sg ip"
    value = module.private_security_group.security_group_name
  
}

output "private_sd_vpc_id" {
    description = "vpc_sg-ip details"
    value = module.private_security_group.security_group_vpc_id
  
}