terraform {
  required_version = "~>1.5"
  required_providers {
    aws ={
        source = "hashicorp/aws"
        version = "5.1.0"
    }
  }
}

provider "aws" {
    region = var.region_name
  
}