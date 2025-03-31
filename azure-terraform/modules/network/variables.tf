
variable "location" {
  description = "Location of the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

# Virtual network
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "Address space of the virtual network"
  type        = list(string)
  default = [ "10.0.0.0/8" ]
}

# Subnets
variable "subnet_name" {
  description = "Subnets of the virtual network"
  type        = string
}

variable "address_prefixes" {
  description = "Address prefixes of the subnets"
  type        = list(string)
  default = [ "10.2.0.0/16" ]
  
}

variable "service_endpoints" {
  description = "Service endpoints of the virtual network"
  type        = list(string)
  default = ["Microsoft.Storage"]
}

# Network security group
variable "security_rules" {
  description = "Security rules of the network security group"
  type        = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = []
}


# Public IP
# Possible values are `Static` or `Dynamic`.
variable "allocation_method" {
  description = "Allocation method of the public IP"
  type        = string
  default     = "Static"
}

# Route table
variable "route_tables" {
  description = "Route tables of the virtual network"
  type        = list(object({
    name       = string
    address_prefix = string
    next_hop_type = string
    next_hop_ip_address = string
  }))
  default = []
}