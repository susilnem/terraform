# Setting version and provider
terraform {
  required_version = ">1.11.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.23.0"
    }
  }
}

# Network interface
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface

resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.vm_name}-ipconfig"
    subnet_id                     = var.vnet_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_id != "" ? var.public_id : null
  }
}

# Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                       = var.vm_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  network_interface_ids      = [azurerm_network_interface.nic.id]
  size                       = var.vm_size
  zone                       = var.zone
  admin_username             = var.admin_username
  encryption_at_host_enabled = var.encryption_at_host_enabled

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  #Custom data
  custom_data = var.cloud_init != "" ? var.cloud_init : null

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.os_version
  }
  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }
}
