
  variable "kv_name" {
    description = "Name of the Key Vault."
    type        = string
  }

  variable "location" {
    description = "Azure region for the Key Vault (e.g. eastus, westeurope)."
    type        = string
  }

  variable "rg_name" {
    description = "Name of the Resource Group."
    type        = string
  }