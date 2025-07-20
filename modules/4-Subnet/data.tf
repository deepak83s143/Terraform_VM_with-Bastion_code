data "azurerm_virtual_network" "vnet-details" {
  name = var.vnet_name
  resource_group_name = var.rg-name
}