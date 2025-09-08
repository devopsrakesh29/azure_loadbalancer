module "resource_group" {
  source   = "../../modules/azurerm_resource_group"
  rg_name  = "rakeshdevlb-rg"
  location = "East US"
}

module "virtual_network" {
  depends_on    = [module.resource_group]
  source        = "../../modules/azurerm_virtual_network"
  rg_name       = "rakeshdevlb-rg"
  location      = "East US"
  vnet_name     = "rakeshdevlb-vnet"
  address_space = ["10.11.0.0/16"]
}

module "subnet" {
  depends_on     = [module.virtual_network]
  source         = "../../modules/azurerm_subnet"
  for_each       = var.subnets
  rg_name        = "rakeshdevlb-rg"
  vnet_name      = "rakeshdevlb-vnet"
  subnet_name    = "rakeshdevlb-subnet"
  address_prefix = ["10.11.1.0/24"]
}

module "public_ip" {
  depends_on  = [module.subnet]
  source      = "../../modules/azurerm_public_ip"
  rg_name     = "rakeshdevlb-rg"
  location    = "East US"
  lb_pip_name = "rakeshdevlb-pip"

}
module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_key_vault"
  rg_name    = "rakeshdevlb-rg"
  location   = "East US"
  kv_name    = "rakeshdevlb-kv"

}

module "key_vault_secret" {
  depends_on      = [module.key_vault]
  source          = "../../modules/azurerm_key_vault_secret"
  for_each        = var.key_vault_secrets
  kv_name         = "rakeshdevlb-kv"
  rg_name         = "rakeshdevlb-rg"
  kv_secret_name  = each.value.name
  kv_secret_value = each.value.value

}

module "bastion" {
  depends_on  = [module.subnet, module.resource_group]
  source      = "../../modules/azurerm_bastion"
  rg_name     = "rakeshdevlb-rg"
  location    = "East US"
  subnet_name = "AzureBastionSubnet"
  vnet_name   = "rakeshdevlb-vnet"

}

module "virtual_machine" {
  depends_on     = [module.subnet, module.key_vault_secret]
  source         = "../../modules/azurerm_virtual_machine"
  for_each       = var.virtual_machines
  vm_name        = each.value.vm_name
  rg_name        = each.value.rg_name
  location       = each.value.location
  subnet_name    = each.value.subnet_name
  vnet_name      = each.value.vnet_name
  username       = each.value.username
  password       = each.value.password
  key_vault_name = each.value.key_vault_name


}

module "loadbalancer" {
  depends_on                     = [module.public_ip, module.virtual_machine]
  source                         = "../../modules/azurerm_loadbalancer"
  rg_name                        = "rakeshdevlb-rg"
  location                       = "East US"
  lb_name                        = "rakeshdevlb-lb"
  frontend_ip_configuration_name = "rakeshdevlb-frontend"
  backend_address_pool_name      = "rakeshdevlb-bappool"
  lb_probe_name                  = "rakeshdevlb-probe"
  lb_rule_name                   = "rakeshdevlb-lbrule"
  lb_pip_name                    = "rakeshdevlb-pip"

}

module "backend_association" {
  depends_on                = [module.loadbalancer]
  source                    = "../../modules/azurerm_backend_association"
  ip_configuration_name     = "internal"
  backend_address_pool_name = "rakeshdevlb-bappool"
  lb_name                   = "rakeshdevlb-lb"
  rg_name                   = "rakeshdevlb-rg"
  for_each                  = var.nic_names
  nic_name                  = each.value.nic_name



}