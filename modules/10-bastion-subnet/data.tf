data "azurerm_resource_group" "rg_details" {
  name = var.rg-name
}
data "azurerm_virtual_network" "vnet_details" {
  name = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg_details.name
}