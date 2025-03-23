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

# Subnet
variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

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

# Virtual machine admin password
variable "admin_password" {
  description = "The password of the local administrator to create on the virtual machine."
  type        = string
}