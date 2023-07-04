# domain route 53 zones id
data "aws_route53_zone" "mydomain" {
  name         = "devopsincloud.com"
#   private_zone = true
}



# output for aws_route53_zone 
output "route_53_output" {
    description = "Hosted Zone id of the desired Hosted Zone"
    value = data.aws_route53_zone.mydomain.zone_id
  
}

output "route_53_name" {
    description = "Hosted Zone name of the desired Hosted Zone"
    value = data.aws_route53_zone.mydomain.name
  
}