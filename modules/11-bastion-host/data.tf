data "azurerm_resource_group" "rg_details" {
  name = var.rg-name
}
data "azurerm_public_ip" "pip_details" {
  name = var.pip_name
  resource_group_name = data.azurerm_resource_group.rg_details.name
}
data "azurerm_subnet" "bastion_sub_details" {
  name = var.bastion_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg_details.name
}