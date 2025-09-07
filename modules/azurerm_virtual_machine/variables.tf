
variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "subnet_name" {
  description = "The name of the Subnet"
  type        = string  
  
}

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string  
  
}

variable "username" {
  description = "The name of the secret in Key Vault for the VM admin username"
  type        = string
  
}

variable "password" {
  description = "The name of the secret in Key Vault for the VM admin password"
  type        = string

}
variable "key_vault_name" {
  description = "The name of the Key Vault where the secrets are stored"
  type        = string
}


variable "vm_name" {
  description = "The name of the Virtual Machine"
  type        = string
  default     = "myVM"
  
}
variable "nic_name" {
  description = "The name of the Network Interface"
  type        = string
  default     = "myNIC"
  
}
