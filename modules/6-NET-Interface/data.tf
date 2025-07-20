data "azurerm_resource_group" "rg_details" {
  name = var.rg-name
}
data "azurerm_subnet" "subnet_details" {
  name = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg_details.name
}