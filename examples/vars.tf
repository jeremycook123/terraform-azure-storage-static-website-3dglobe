variable "subscription_id" {
  type        = string
  description = "value for the subscription id, used to authenticate with Azure."
}

variable "tenant_id" {
  type        = string
  description = "value for the tenant id, used to authenticate with Azure."
}

variable "rg_name" {
  type        = string
  description = "Name of the resource group where the static website will be deployed."
}

variable "website_name" {
  type        = string
  description = "Name of the static website, must be globally unique. Only lowercase letters and numbers, 3–24 characters."

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.website_name))
    error_message = "The website_name must be 3–24 characters long and contain only lowercase letters and numbers."
  }
}
