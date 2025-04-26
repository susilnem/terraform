output "network_interface_id" {
  value = azurerm_network_interface.nic.id
  description = "The ID of the network interface"
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
  description = "The ID of the virtual machine"
}

output "vm_public_ip_address" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
  description = "The public IP address of the virtual machine"
}
output "vm_private_ip_address" {
  value = azurerm_linux_virtual_machine.vm.private_ip_address
  description = "The private IP address of the virtual machine"
}
