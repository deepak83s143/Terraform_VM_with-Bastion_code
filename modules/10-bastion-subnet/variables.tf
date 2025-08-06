variable "rg-name" {
  type = string
}
variable "vnet_name" {
  type = string
}
variable "bastion_subnet_name" {
  type = string
}
variable "bastion_add_prefix" {
  type = list(string)
}