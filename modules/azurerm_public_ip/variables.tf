variable "lb_pip_name" {
  description = "The name of the Public IP"
  type        = string      
  
}
variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}
variable "location" {
  description = "The location of the resource group"
  type        = string
}