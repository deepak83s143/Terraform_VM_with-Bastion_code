data "azurerm_resource_group" "rg_details" {
  name = var.rg-name
}
data "azurerm_network_interface" "inet_details" {
  name = var.net_intface_name
  resource_group_name = data.azurerm_resource_group.rg_details.name
}
data "azurerm_key_vault" "kv-details" {
  name = "mademi-kv"
  resource_group_name = "mademi-rg"
}
data "azurerm_key_vault_secret" "username" {
  name = "uname"
  key_vault_id = data.azurerm_key_vault.kv-details.id
}
data "azurerm_key_vault_secret" "password" {
  name = "passwd"
  key_vault_id = data.azurerm_key_vault.kv-details.id
}
