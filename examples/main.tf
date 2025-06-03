terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.30"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

module "globe" {
  source  = "jeremycook123/storage-static-website-3dglobe/azure"
  version = ">= 1.0.0"

  resource_group_name = var.rg_name
  website_name        = var.website_name

  tags = {
    environment = "dev"
    project     = "3dglobe"
  }
}
