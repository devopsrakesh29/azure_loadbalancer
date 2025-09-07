terraform {
  backend "azurerm" {
    resource_group_name  = "backendrak-rg"
    storage_account_name = "b35rakeshtfstg"
    container_name       = "tfstatefile"
    key                  = "devado.terraform.tfstate"

  }
}