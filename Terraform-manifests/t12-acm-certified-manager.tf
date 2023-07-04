# acm certificate for https and validation of route 53 

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = data.aws_route53_zone.mydomain.name
  zone_id      = data.aws_route53_zone.mydomain.zone_id

  subject_alternative_names = [
    "*.devopsincloud.com"
    
  ]


  tags = local.common_tags

}

# output for acm certificate

output "acm_certi" {
    description = "The ARN of the certificate"
    value = module.acm.acm_certificate_arn
  
}