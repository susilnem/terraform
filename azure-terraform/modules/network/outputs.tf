output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.subnets.id
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.nsg.id
}

output "public_ip_id" {
  description = "The ID of the public IP"
  value       = azurerm_public_ip.public_ip.id
}

output "network_interface_id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.nic.id
}

