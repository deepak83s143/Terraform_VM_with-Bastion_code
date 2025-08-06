
resource "azurerm_bastion_host" "bastion-host" {
  name = var.bastion_host_name
  location = data.azurerm_resource_group.rg_details.location
  resource_group_name = data.azurerm_resource_group.rg_details.name
  sku = "Standard"
  tunneling_enabled = true
  ip_configuration {
    name = var.bastion_ip_name
    subnet_id = data.azurerm_subnet.bastion_subnet.id
    public_ip_address_id = data.azurerm_public_ip.bastion_pip.id
  }
}


