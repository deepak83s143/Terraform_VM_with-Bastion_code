variable "rg-name" {
  type = string
}
variable "rg-location" {
  type = string
}
variable "vnet_name" {
  type = string
}
variable "address_space" {
  type = list(string)
}
variable "subnet_name" {
  type = string
}
variable "address_prefixes" {
  type = list(string)
}
variable "pip_name" {
  type = string
}
variable "net_intface_name" {
  type = string
}
variable "interface_ip_name" {
  type = string
}
variable "vm_name" {
  type = string
}
variable "nsg_name" {
  type = string
}
variable "bastion_ip_name" {
  type = string
}
variable "bastion_host_name" {
  type = string
}
variable "bastion_subnet_name" {
  type = string
}
variable "bastion_add_prefix" {
  type = list(string)
}
