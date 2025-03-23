# virtual machine

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "location" {
  description = "The location/region where the virtual machine will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual machine."
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_DS1_v2"
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "admin_username" {
  description = "The username of the local administrator to create on the virtual machine."
  type        = string
}

variable "admin_password" {
  description = "The password of the local administrator to create on the virtual machine."
  type        = string
}

variable "network_interface_ids" {
  description = "A list of IDs of network interfaces to associate with the virtual machine."
  type        = list(string)
}