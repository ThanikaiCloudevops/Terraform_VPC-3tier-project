# key for login
variable "instance_key" {
    description = "login instance of key_pair "
    type = string
    default = "terraform-key"
  
}
# type 0f instance
variable "type_instance" {
    description = "instance types assign to vm "
    type = string
    default = "t2.micro"
  
}
#number of instance
variable "vm_number" {
    description = "number of instance to aws"
    type = number
    default = 2
  
}

# subnets ids
# variable "subnets_count" {
#     description = "Subnets count increase"
#     type = list(string)
#     default = 
  
# }