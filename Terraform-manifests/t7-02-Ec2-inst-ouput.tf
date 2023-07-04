output "public-instance" {
    description = "public id"
    value = module.public-ec2-instance.id
  
}

output "public-ip" {
    description = "public bastion ip"
    value = module.public-ec2-instance.public_ip
  
}

output "private-id" {
    description = "private id"
    value = module.private-ec2-instance-app1.id
  
}
output "private-ip" {
    description = "private ip"
    value = module.private-ec2-instance-app1.private_ip
  
}

output "private-id-app2" {
    description = "private id app2"
    value = module.private-ec2-instance-app2.id
  
}

output "private-ip-app2" {
    description = "private ip app2"
    value = module.private-ec2-instance-app2.private_ip
  
}