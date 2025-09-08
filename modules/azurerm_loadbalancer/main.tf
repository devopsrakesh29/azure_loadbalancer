resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name


  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = data.azurerm_public_ip.lb_pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "bap" {
  
  loadbalancer_id     = azurerm_lb.lb.id
  name                = var.backend_address_pool_name
}


resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = var.lb_probe_name
  protocol        = "Tcp"
  port            = 80
  interval_in_seconds = 5
  
}
resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id            = azurerm_lb.lb.id
  name                       = var.lb_rule_name
  protocol                   = "Tcp"
  frontend_port              = 80
  backend_port               = 80
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
}



