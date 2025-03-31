# Virtual Machine
resource "azurerm_virtual_machine" "vm" {
    name = var.vm_name
    location = var.location
    resource_group_name = var.resource_group_name
    network_interface_ids = var.network_interface_ids
    vm_size = var.vm_size

    storage_os_disk {
        name = "${var.vm_name}-osdisk"
        caching = "ReadWrite"
        create_option = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    os_profile {
        computer_name = var.vm_name
        admin_username = var.admin_username
        admin_password = var.admin_password
    }
    os_profile_linux_config {
        disable_password_authentication = false
    }
}