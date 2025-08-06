resource "azurerm_virtual_network" "vnet_create" {
  name = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg_details.name
  location = data.azurerm_resource_group.rg_details.location
  address_space = var.address_space
}