resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

#STORAGE ACCOUNT
#================================

resource "azurerm_storage_account" "website" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  # must be UNIQUE across the entire Azure service, not just within the resource group.
  name = var.website_name

  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  tags = var.tags
}

resource "azurerm_storage_account_static_website" "website" {
  storage_account_id = azurerm_storage_account.website.id
  index_document     = "index.html"
}

resource "azurerm_storage_blob" "index_html" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.website.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/website/index.html"
  content_type           = "text/html"

  depends_on = [
    azurerm_storage_account_static_website.website
  ]
}

resource "azurerm_storage_blob" "globe_js" {
  name                   = "globe.js"
  count                  = var.rotate ? 0 : 1
  storage_account_name   = azurerm_storage_account.website.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/website/globe.js"
  content_type           = "text/javascript"

  depends_on = [
    azurerm_storage_account_static_website.website
  ]
}

resource "azurerm_storage_blob" "globe_rotate_js" {
  name                   = "globe.js"
  count                  = var.rotate ? 1 : 0
  storage_account_name   = azurerm_storage_account.website.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/website/globe.rotate.js"
  content_type           = "text/javascript"

  depends_on = [
    azurerm_storage_account_static_website.website
  ]
}

resource "azurerm_storage_blob" "elevation_json" {
  name                   = "elevation_15000.json"
  storage_account_name   = azurerm_storage_account.website.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/website/elevation_15000.json"
  content_type           = "application/json"

  depends_on = [
    azurerm_storage_account_static_website.website
  ]
}

resource "azurerm_storage_blob" "world_jpg" {
  name                   = "world.jpg"
  storage_account_name   = azurerm_storage_account.website.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/website/world.jpg"
  content_type           = "image/jpeg"

  depends_on = [
    azurerm_storage_account_static_website.website
  ]
}

resource "azurerm_storage_blob" "js_folder" {
  for_each               = fileset("${path.module}/website/js", "*.js")
  name                   = "js/${each.key}"
  storage_account_name   = azurerm_storage_account.website.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/website/js/${each.key}"
  content_type           = "text/javascript"

  depends_on = [
    azurerm_storage_account_static_website.website
  ]
}
