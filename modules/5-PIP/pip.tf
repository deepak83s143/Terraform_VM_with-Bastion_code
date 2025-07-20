
resource "azurerm_public_ip" "publicIP_create" {
  name = var.pip_name
  resource_group_name = data.azurerm_resource_group.rg_details.name
  location = data.azurerm_resource_group.rg_details.location
  allocation_method = "Static"
}

