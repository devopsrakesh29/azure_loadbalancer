key_vault_secrets = {
  "username" = {
    
    name    = "username"
    value   = "azureuser"
  }
  "password" = {
    
    name    = "password"
    value   = "Password@123456!"
  }
}

virtual_machines = {
  "vm1" = {
    rg_name        = "rakeshdevlb-rg"
    vm_name        = "rakeshdevlb-vm1"
    nic_name       = "rakeshdevlb-nic1"
    location       = "East US"
    subnet_name    = "rakeshdevlb-subnet"
    vnet_name      = "rakeshdevlb-vnet"
    username       = "username"
    password       = "password"
    key_vault_name = "rakeshdevlb-kv"
  }

  "vm2" = {
    rg_name        = "rakeshdevlb-rg"
    vm_name        = "rakeshdevlb-vm2"
    nic_name       = "rakeshdevlb-nic2"
    location       = "East US"
    subnet_name    = "rakeshdevlb-subnet"
    vnet_name      = "rakeshdevlb-vnet"
    username       = "username"
    password       = "password"
    key_vault_name = "rakeshdevlb-kv"
  }
}

nic_names = {
  "nic1" = {
    nic_name = "rakeshdevlb-nic1"
  },
  "nic2" = {
    nic_name = "rakeshdevlb-nic2"
  }
}
