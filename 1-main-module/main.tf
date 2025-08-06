module "rg_create" {
  source      = "../modules/2-Resource-Group"
  rg-name     = var.rg-name
  rg-location = var.rg-location
}

module "vnet_create" {
  depends_on    = [module.rg_create]
  source        = "../modules/3-VNET"
  vnet_name     = var.vnet_name
  address_space = var.address_space
  rg-name       = var.rg-name
}

module "subnet_create" {
  depends_on       = [module.vnet_create]
  source           = "../modules/4-Subnet"
  rg-name          = var.rg-name
  vnet_name        = var.vnet_name
  subnet_name      = var.subnet_name
  address_prefixes = var.address_prefixes

}

module "publicIP_create" {
  depends_on = [module.subnet_create]
  source     = "../modules/5-PIP"
  pip_name   = var.pip_name
  rg-name    = var.rg-name
}

module "net_intface_create" {
  depends_on        = [module.publicIP_create]
  source            = "../modules/6-NET-Interface"
  rg-name           = var.rg-name
  subnet_name       = var.subnet_name
  net_intface_name  = var.net_intface_name
  interface_ip_name = var.interface_ip_name
  vnet_name         = var.vnet_name
}

module "vm-create" {
  depends_on       = [module.net_intface_create]
  source           = "../modules/7-VM"
  rg-name          = var.rg-name
  net_intface_name = var.net_intface_name
  vm_name          = var.vm_name
}

module "nsg_create" {
  depends_on = [module.vm-create]
  source     = "../modules/8-NSG"
  nsg_name   = var.nsg_name
  rg-name    = var.rg-name
}

module "nsg_association" {
  depends_on  = [module.nsg_create]
  source      = "../modules/9-NSG-ASSOCIATION"
  rg-name     = var.rg-name
  vnet_name   = var.vnet_name
  nsg_name    = var.nsg_name
  subnet_name = var.subnet_name
}

module "bastion_subnet_create" {
  depends_on          = [module.nsg_association]
  source              = "../modules/10-bastion-subnet"
  rg-name             = var.rg-name
  vnet_name           = var.vnet_name
  bastion_subnet_name = var.bastion_subnet_name
  bastion_add_prefix  = var.bastion_add_prefix
}

module "bastion_host" {
  depends_on          = [module.bastion_subnet_create]
  source              = "../modules/11-bastion-host"
  rg-name             = var.rg-name
  pip_name            = var.pip_name
  bastion_host_name   = var.bastion_host_name
  vnet_name           = var.vnet_name
  bastion_subnet_name = var.bastion_subnet_name
  bastion_ip_name     = var.bastion_ip_name

}

