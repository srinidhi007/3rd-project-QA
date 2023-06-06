provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {}
}
terraform {
  backend "azurerm" {
    storage_account_name = "sristorageaccountqa"
    container_name       = "container-qa"
    key                  = "terraform.tfstate"
    access_key           = "mDiQNTYfPkgCtnE3ZWV5TvFDmy1hUNyPISyWz9MyM5fylZsoTqMnPs3cfFO1b5ZI1CHkJAY5AtL7+AStZwDnkA=="
  }
}
module "resource_group" {
  source               = "./modules/resource_group"
  resource_group       = "${var.resource_group}"
  location             = "${var.location}"
}
module "app_service" {
  source               = "./modules/appservice"
  resource_group       = "${var.resource_group}"
  location             = "${var.location}"
  resource_type        = "AppService"
  application_type     = "${var.application_type}"
  tags                 = local.tags
}

locals {
  tags = {
    tier = "Test"
    deployment = "Terraform"
  }
}
