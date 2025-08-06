resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  network_security_group_id = data.azurerm_network_security_group.nsg_details.id
  subnet_id = data.azurerm_subnet.subnet_details.id
}

