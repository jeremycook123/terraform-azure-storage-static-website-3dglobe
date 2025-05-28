variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "website_name" {
  type        = string
  description = "Value for the storage account name, must be globally unique. Only lowercase letters and numbers, 3–24 characters."

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.website_name))
    error_message = "The website_name must be 3–24 characters long and contain only lowercase letters and numbers."
  }
}

variable "tags" {
  type        = map(string)
  description = "tags for the resources"
  default = {
    environment = "dev"
    project     = "static-website"
  }
}
