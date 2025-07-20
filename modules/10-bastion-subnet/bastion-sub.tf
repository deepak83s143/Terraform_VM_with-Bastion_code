resource "azurerm_subnet" "bastion_subnet" {
  name = var.bastion_subnet_name
  resource_group_name = data.azurerm_resource_group.rg_details.name
  virtual_network_name = data.azurerm_virtual_network.vnet_details.name
  address_prefixes = var.bastion_add_prefix
}

