variable "tenant_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "environment" {
  description = "Environment bucket resides in"
  type        = string
  default     = "prod"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "create_random_suffix" {
  description = "Add random suffix to bucket name"
  type        = bool
  default     = false
}

variable "website_name" {
  type        = string
  description = "value for the storage account name, must be globally unique"
}

variable "tags" {
  type        = map(string)
  description = "tags for the resources"
  default = {
    environment = "dev"
    project     = "static-website"
  }
}
