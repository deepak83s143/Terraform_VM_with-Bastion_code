resource "azurerm_resource_group" "rg_create" {
  name = var.rg-name
  location = var.rg-location
}