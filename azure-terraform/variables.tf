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