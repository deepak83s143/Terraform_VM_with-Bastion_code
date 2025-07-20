resource "azurerm_subnet" "subnet_create" {
  name = var.subnet_name
  resource_group_name = data.azurerm_virtual_network.vnet-details.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet-details.name
  address_prefixes = var.address_prefixes
}