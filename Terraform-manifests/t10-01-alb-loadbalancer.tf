# Terraform application load balancer 

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.7.0"

  name = "${local.Env}-alb"
  load_balancer_type = "application"
  vpc_id = module.vpc.vpc_id

  subnets = [module.vpc.public_subnets[0],module.vpc.public_subnets[1]]
  security_groups = [module.bastion_security_group.security_group_id]

  # listeners for instance listen on 
  # redirect to http to https
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
]
 # target_groups for set the vm ware into corresp ec2 instance
  target_groups = [
    {
      name_prefix      = "app1"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      targets = {
        app1-vm1 = {
          target_id = module.private-ec2-instance-app1.id[0]
          port = 80
        }
        app2-vm2 = {
          target_id = module.private-ec2-instance-app1.id[1]
          port = 80
        }
      }
    },
        {
      name_prefix      = "app2"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app2/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      targets = {
        app2-vm1 = {
          target_id = module.private-ec2-instance-app2.id[0]
          port = 80
        }
        app2-vm2 = {
          target_id = module.private-ec2-instance-app2.id[1]
          port = 80
        }
      }
    },

  ]
  # https tcp listerners to validate certificate and fixed path routing
  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = module.acm.acm_certificate_arn
       fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed message - This is Root Content"
        status_code  = "200"
      }
    },
  ] 
  # https listerner rules for app1 and app2
  https_listener_rules = [
    # rules for app1 lister this rules listen for app1
    {
      https_listener_index = 0
      priority = 1

      actions = [
        {
          type = "forward"
          target_group_index = 0

        },
      ]

      conditions = [{
        # path_patterns = ["/app1*"]               # context path routing
        # host_header = [var.app1_dns]            # host header based routing
         http_headers =[{
          http_header_name = "custom-header"
          values = ["app1","app-1","my-app-1"]
        }]
        
      }]
    },
    # Rules for app2 This listen app2 rules
      {
      https_listener_index = 0
      priority = 2

      actions = [
        {
          type = "forward"
          target_group_index = 1

        },
      ]

      conditions = [{
        # path_patterns = ["/app2*"]
        # host_header = [var.app2_dns]
         http_header=[{
          http_header_name = "custom-header"
          values = ["app2","app-2","my-app-2"]
        }]
        

      }]
    },
    # Query string for conditions (priority=0)
        {
      https_listener_index = 0
      priority             = 3
      actions = [{
        type        = "redirect"
        status_code = "HTTP_302"
        host        = "thanikaicloudevops.com"
        path        = "/aks-eks/"
        query       = ""
        protocol    = "HTTPS"
      }]

      conditions = [{
        query_strings = [{
          key   = "website"
          value = ["aws-eks.devopsincloud.com"]
        }]
      }]
    },
       {
      https_listener_index = 0
      priority             = 4
      actions = [{
        type        = "redirect"
        status_code = "HTTP_302"
        host        = "thanikaicloudevops.com"
        path        = "/azure-aks.kubernets-service-intro"
        query       = ""
        protocol    = "HTTPS"
      }]

      conditions = [{
       host_headers = ["azure-aks.devopsincloud.com"]
        
      }]
    }
    
  ]
    tags = local.common_tags

}