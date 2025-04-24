variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
  default     = "susilnem-rg"
}

variable "resource_group_location" {
  description = "The location/region where the resource group will be created. For example, East US or West Europe."
  type        = string
  default     = "East US"
}

# virtual network
variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
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

# variable "vnet_subnet_id" {
#   description = "The ID of the subnet in which to create the virtual machine."
#   type        = string
# }

# Virtual machine
variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

# Virtual machine size
variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_DS1_v2"
}

# Virtual machine admin username
variable "admin_username" {
  description = "The username of the local administrator to create on the virtual machine."
  type        = string
}

variable "ssh_public_key_path" {
  description = "The path to the SSH public key file."
  type        = string
}

variable "create_public_ip" {
  description = "Create a public IP address"
  type        = bool
  default     = false
}

