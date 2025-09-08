
variable "kv_secret_name" {
  description = "The name of the Key Vault Secret."
  type        = string
  
}

variable "kv_secret_value" {
  description = "The value of the Key Vault Secret."
  type        = string

}
variable "kv_name" {
  description = "Name of the Key Vault where the secret will be stored."
  type        = string
}
variable "rg_name" {
  description = "Name of the Resource Group where the Key Vault is located."
  type        = string
}