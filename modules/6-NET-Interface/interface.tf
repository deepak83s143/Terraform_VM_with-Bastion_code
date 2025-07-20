
resource "azurerm_network_interface" "network_interface" {
  name = var.net_intface_name
  resource_group_name = data.azurerm_resource_group.rg_details.name
  location = data.azurerm_resource_group.rg_details.location
  ip_configuration {
    name = var.interface_ip_name
    subnet_id = data.azurerm_subnet.subnet_details.id
    private_ip_address_allocation = "Dynamic"
  }
}

