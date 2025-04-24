output "network_interface_id" {
  value = azurerm_network_interface.nic.id
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

output "vm_public_ip_address" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
}
output "vm_private_ip_address" {
  value = azurerm_linux_virtual_machine.vm.private_ip_address
}