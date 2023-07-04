variable "vpc_id" {
    description = "represents the vpc id"
    type = string
    default = "VPC"
  
}

variable "cidr_blocks" {
    description = "This is show as range of ip"
    type = string
    default = "10.0.0.0/16"
  
}

variable "availiablity_zones" {
    description = "show us zones"
    type = list(string)
    default = ["us-east-1a","us-east-1b"]
  
}
variable "public_subnet" {
    description = "indicates ip of public network"
    type = list(string)
    default = ["10.0.101.0/24","10.0.102.0/24"]
  
}

variable "priavte_subnet" {
    description = "indicates ip of private network"
    type = list(string)
    default =  ["10.0.1.0/24","10.0.2.0/24"]
  
}

variable "database_subnet" {
    description = "indicates ip of database assign"
    type = list(string)
    default = ["10.0.151.0/24","10.0.152.0/24"]
  
}

variable "create_database_group" {
    description = "creating  subnet for database"
    type = bool
    default = true
  
}
variable "create_database_route_table" {
    description = "creating route table for database"
    type = bool
    default = true
  
}

variable "assign_nat_gateway" {
    description = "enable nat gateway for private subnets"
    type = bool
    default = true
  
}

variable "single_nat_gateway" {
    description = "single nat gateway for private subnets"
    type = bool
    default = true
  
}