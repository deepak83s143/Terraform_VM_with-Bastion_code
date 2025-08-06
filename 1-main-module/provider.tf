terraform {
  required_version = "1.12.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "mademi-rg"
    storage_account_name = "mademistg"
    container_name       = "mademitfstate"
    key                  = "VmWithDocker.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "4f66054f-49b5-4a50-97d4-b19124d09600"
}
