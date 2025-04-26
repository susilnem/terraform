# virtual machine

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "location" {
  description = "The location/region where the virtual machine will be created."
  type        = string
}
variable "publisher" {
  description = "The publisher of the image to use for the virtual machine."
  type        = string
  default     = "Canonical"
}

variable "vnet_subnet_id" {
  description = "The ID of the subnet in which to create the virtual machine."
  type        = string
}

variable "public_id" {
  description = "The ID of the public IP address to associate with the virtual machine."
  type        = string
  default     = ""
}

variable "offer" {
  description = "The offer of the image to use for the virtual machine."
  type        = string
  default     = "UbuntuServer"
}

variable "sku" {
  description = "The SKU of the image to use for the virtual machine."
  type        = string
  default     = "18.04-LTS"
}

variable "os_version" {
  description = "The version of the image to use for the virtual machine."
  type        = string
  default     = "latest"
}

variable "zone" {
  description = "The availability zone in which to create the virtual machine."
  type        = string
  default     = null
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

variable "encryption_at_host_enabled" {
  description = "Enable encryption at host for the virtual machine."
  type        = bool
  default     = false
}

variable "admin_username" {
  description = "The username of the local administrator to create on the virtual machine."
  type        = string
}

variable "ssh_public_key_path" {
  description = "The path to the SSH public key file."
  type        = string
}

variable "cloud_init" {
  description = "Init configuration for the virtual machine."
  type        = string
  default     = ""
}

variable "caching" {
  description = "The caching type for the OS disk."
  type        = string
  default     = "ReadWrite"
}

variable "storage_account_type" {
  description = "The type of storage account to use for the OS disk."
  type        = string
  default     = "Standard_LRS"

  validation {
    condition     = contains(["Standard_LRS", "Premium_LRS", "StandardSSD_LRS", "StandardSSD_ZRS", "Premium_ZRS"], var.storage_account_type)
    error_message = "The storage account type must be one of Standard_LRS, Premium_LRS, StandardSSD_LRS, StandardSSD_ZRS, or Premium_ZRS."
  }
}

