# Terraform_VM_with-Bastion_code
# 🚀 Terraform Azure VM Deployment with Bastion Host

This repository provides a modular Terraform configuration to deploy a Virtual Machine (VM) securely in Microsoft Azure with Bastion Host access. It includes all necessary infrastructure components such as Virtual Network, Subnet, Public IP, NSG, and Bastion.

---

## 📦 Modules Used

The deployment uses the following custom modules located in the `../modules` directory:

- `2-Resource-Group` – Creates the Resource Group
- `3-VNET` – Creates the Virtual Network
- `4-Subnet` – Defines subnets for VM and Bastion
- `5-PIP` – Creates a Public IP
- `6-NET-Interface` – Configures the NIC for the VM
- `7-VM` – Provisions the Virtual Machine
- `8-NSG` – Creates Network Security Group
- `9-NSG-ASSOCIATION` – Associates NSG with subnet
- `10-bastion-subnet` – Creates a subnet for Bastion Host
- `11-bastion-host` – Deploys the Bastion Host

---

## 📁 Directory Structure

```
Terraform_VM_with-Bastion_code/
├── 1-main-module/
│   ├── main.tf                  # Calls all modules in order
│   ├── provider.tf              # Azure provider configuration
│   ├── terraform.tfvars         # Variable values for deployment
│   └── variables.tf             # Input variables definition
│
└── modules/
    ├── 2-Resource-Group/        # Creates Azure Resource Group
    ├── 3-VNET/                  # Creates Virtual Network
    ├── 4-Subnet/                # Creates Subnet(s) for VM
    ├── 5-PIP/                   # Creates Public IP Address
    ├── 6-NET-Interface/         # Creates Network Interface
    ├── 7-VM/                    # Provisions the Virtual Machine
    ├── 8-NSG/                   # Creates Network Security Group
    ├── 9-NSG-ASSOCIATION/       # Associates NSG with Subnet
    ├── 10-bastion-subnet/       # Creates AzureBastionSubnet
    └── 11-bastion-host/         # Deploys the Bastion Host
```

---

## 🧰 Prerequisites

- Terraform >= 1.10.0
- Backend configuration.
    - `Storage Account`.
    - `Container` for save tfstate files of the projects.
- Cloud provider credentials configured (e.g., Azure CLI)
- Key Vault (Manual or Using Terraform.)
    - Secrets.
        - `Username`.
        - `Password.`

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone git@github.com:deepak83s143/Terraform_VM_with-Bastion_code.git
cd Terraform_VM_with-Bastion_code
```
### 2. Update Provider.tf 

> ✏️ **Note**: Make sure to update `provider.tf` with your required Azure provider configuration and region.  
> Example: Set your desired `features {}` block and authenticate via CLI or Service Principal.

**Sample**

```bash
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
  subscription_id = "xxxxx-xxxxx-xxxxxx-xxxxx"
}
```

### 3. Update the terraform.tfvars file with your values:

**Sample**

```bash
rg-name              = "demo-rg"
rg-location          = "East US"
vnet_name            = "demo-vnet"
address_space        = ["10.0.0.0/16"]
subnet_name          = "vm-subnet"
address_prefixes     = ["10.0.1.0/24"]
pip_name             = "demo-pip"
net_intface_name     = "demo-nic"
interface_ip_name    = "demo-ip"
vm_name              = "demo-vm"
nsg_name             = "demo-nsg"
bastion_subnet_name  = "AzureBastionSubnet"
bastion_add_prefix   = ["10.0.100.0/27"]
bastion_host_name    = "demo-bastion"
bastion_ip_name      = "bastion-ip"
```

### 4. Initialize Terraform
```bash
terraform init
```
### 5. Review the Execution Plan
```bash
terraform plan
```
### 6. Apply the Configuration
```bash
terraform apply
```

## 🔐 Accessing the VM

- Use Azure Portal to access the VM via Bastion (no need for public IP on VM).
- Bastion Host improves security by eliminating SSH exposure to the internet.

## 🧹 Clean Up

```bash
terraform destroy  (Never recommended...)
```

## 📌 Notes

- Make sure the Bastion subnet is named exactly AzureBastionSubnet (Azure requirement).
- Ensure the address ranges for the Bastion subnet and VM subnet do not overlap.

## 👨‍💻 Author

**Deepak Sharma** <br>
**GitHub**: @deepak83s143

