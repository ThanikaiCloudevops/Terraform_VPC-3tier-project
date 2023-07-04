# dns for domain

resource "aws_route53_record" "dns_app" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = "myapps.devopsincloud.com"
  type    = "A"
  alias    {
        name    = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
        evaluate_target_health = true
        
  }
}

# It will route app1.devopsincloud.com (it is host header routing)
resource "aws_route53_record" "dns_app1" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = var.app1_dns
  type    = "A"
  alias    {
        name    = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
        evaluate_target_health = true
        
  }
}

# It will route app2.devopsincloud.com (it is host header routing)
resource "aws_route53_record" "dns_app2" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = var.app2_dns
  type    = "A"
  alias    {
        name    = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
        evaluate_target_health = true
        
  }
}