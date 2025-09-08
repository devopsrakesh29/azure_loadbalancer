
variable "subnet_name" {
  description = "The name of the subnet to deploy the Bastion host into"
  type        = string
  
}

variable "vnet_name" {
  description = "The name of the virtual network containing the subnet"
  type        = string


}

variable "rg_name" {
  description = "The name of the resource group containing the virtual network and subnet"
  type        = string      
  
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}