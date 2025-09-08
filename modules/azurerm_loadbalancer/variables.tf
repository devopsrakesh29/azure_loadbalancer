variable "lb_name" {
  description = "Name of the Load Balancer."
  type        = string
}

variable "location" {
  description = "Azure region for the Load Balancer."
  type        = string
}

variable "rg_name" {
  description = "Resource group name for the Load Balancer."
  type        = string
}

variable "frontend_ip_configuration_name" {
  description = "Name of the frontend IP configuration."
  type        = string
}

variable "backend_address_pool_name" {
  description = "Name of the backend address pool."
  type        = string
}

variable "lb_probe_name" {
  description = "Name of the load balancer probe."
  type        = string
}

variable "lb_rule_name" {
  description = "Name of the load balancer rule."
  type        = string
}

variable "lb_pip_name" {
  description = "Name of the Public IP for the Load Balancer."
  type        = string
  
}