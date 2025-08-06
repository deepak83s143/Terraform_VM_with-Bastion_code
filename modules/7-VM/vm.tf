
resource "azurerm_linux_virtual_machine" "VM_Create" {
  name = var.vm_name
  resource_group_name = data.azurerm_resource_group.rg_details.name
  location = data.azurerm_resource_group.rg_details.location
  network_interface_ids = [ data.azurerm_network_interface.inet_details.id ]
  size = "Standard_D2a_v4"
  admin_username = data.azurerm_key_vault_secret.username.value
  admin_password = data.azurerm_key_vault_secret.password.value
  os_disk {
    storage_account_type = "Standard_LRS"
    caching = "ReadWrite"
  }
  disable_password_authentication = false
  source_image_reference {
    publisher = "canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
  }
  custom_data = base64encode(<<-EOF
  #!/bin/bash
  apt update && apt install -y nginx
  rm -rf /var/www/html/*
  echo "<h1>Welcome to MademiTech<h1>" > /var/www/html/index.html
  systemctl restart nginx && systemctl enable nginx
  EOF
  )
}