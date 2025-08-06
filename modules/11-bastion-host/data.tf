data "azurerm_resource_group" "rg_details" {
  name = var.rg-name
}
data "azurerm_subnet" "bastion_subnet" {
  name = var.bastion_subnet_name
  resource_group_name = data.azurerm_resource_group.rg_details.name
  virtual_network_name = var.vnet_name
}
data "azurerm_public_ip" "bastion_pip" {
  name = var.pip_name
  resource_group_name = data.azurerm_resource_group.rg_details.name
}