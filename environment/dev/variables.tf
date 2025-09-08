variable "virtual_machines" {}
variable "key_vault_secrets" {
  type = map(object({
    name  = string
    value = string
  }))
}

variable "nic_names" {
  type = map(object({
    nic_name = string
  }))

}

variable "subnets" {
 }
  
