# refer the terrafrom variable

variable "app1_dns" {
    description = "This mention the dns name in tfvars app1"
    type = string
    default = "app1.devopsincloud.com"
  
}

variable "app2_dns" {
    description = "This mention the dns name in tvars app2"
    type = string
    default = "app2.devopsincloud.com"
  
}