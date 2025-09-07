variable "ip_configuration_name" {
  description = "Name of the NIC IP configuration to associate with the backend pool."
  type        = string
}

variable "backend_address_pool_name" {
  description = "Name of the load balancer backend address pool."
  type        = string
}

variable "lb_name" {
  description = "Name of the load balancer."
  type        = string
}

variable "rg_name" {
  description = "Resource group name where the resources reside."
  type        = string
}

variable "nic_name" {
  description = "Name of the network interface to associate with the backend pool."
  type        = string
}