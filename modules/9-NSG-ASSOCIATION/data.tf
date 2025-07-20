data "azurerm_network_security_group" "nsg_details" {
  name = var.nsg_name
  resource_group_name = var.rg-name
}
data "azurerm_subnet" "subnet_details" {
  name = var.subnet_name
  resource_group_name = var.rg-name
  virtual_network_name = var.vnet_name
}