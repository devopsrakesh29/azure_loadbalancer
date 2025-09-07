resource "azurerm_public_ip" "lb_pip" {
  name                = var.lb_pip_name
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"


}  

