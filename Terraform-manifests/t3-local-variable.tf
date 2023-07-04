locals {
  Env = var.Environment
  Business = var.Business
  name = "${var.Environment}-${var.Business}"

  common_tags ={
    Env = local.Env
    Business = local.Business
  }
}