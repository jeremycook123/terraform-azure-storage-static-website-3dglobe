<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.website](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_static_website.website](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_static_website) | resource |
| [azurerm_storage_blob.elevation_json](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |
| [azurerm_storage_blob.globe_js](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |
| [azurerm_storage_blob.index_html](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |
| [azurerm_storage_blob.js_folder](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |
| [azurerm_storage_blob.world_jpg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"eastus"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for the resources | `map(string)` | <pre>{<br/>  "environment": "dev",<br/>  "project": "static-website"<br/>}</pre> | no |
| <a name="input_website_name"></a> [website\_name](#input\_website\_name) | Value for the storage account name, must be globally unique. Only lowercase letters and numbers, 3–24 characters. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_website_url"></a> [website\_url](#output\_website\_url) | n/a |
<!-- END_TF_DOCS -->