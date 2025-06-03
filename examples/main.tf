terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.30"
    }
  }
}


module "globe" {
  source  = "jeremycook123/storage-static-website-3dglobe/azure"
  version = "= 0.0.6"

  resource_group_name = "3dglobe"
  website_name        = "cadevops3dglobe"

  tags = {
    environment = "dev"
    project     = "3dglobe"
  }
}