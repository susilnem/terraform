
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
  default     = ["10.0.0.0/8"]
}

# Subnets
variable "subnets" {
  description = "Subnets of the virtual network"
  type = map(object({
    name              = string
    address_prefixes  = list(string)
    service_endpoints = list(string)
    service_delegations = map(object({
      name    = string
      actions = list(string)
    }))
  }))
  default = null
}


# Create Public IP
variable "create_public_ip" {
  description = "Create a public IP address"
  type        = bool
  default     = false
}

# Network security group
variable "security_rules" {
  description = "Security rules of the network security group"
  type = list(object({
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


# Route table
variable "route_tables" {
  description = "Route tables of the virtual network"
  type = list(object({
    name                = string
    address_prefix      = string
    next_hop_type       = string
    next_hop_ip_address = string
  }))
  default = []
}
