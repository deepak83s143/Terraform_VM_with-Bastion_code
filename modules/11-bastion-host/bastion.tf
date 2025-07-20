resource "azurerm_bastion_host" "bastion_host" {
  name = var.bastion_name
  resource_group_name = data.azurerm_resource_group.rg_details.name
  location = data.azurerm_resource_group.rg_details.location
  sku = "Standard"
  tunneling_enabled = true
  ip_configuration {
    subnet_id = data.azurerm_subnet.bastion_sub_details.id
    name = var.bastion_ip
    public_ip_address_id = data.azurerm_public_ip.pip_details.id
  }
}