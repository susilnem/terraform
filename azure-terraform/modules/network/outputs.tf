output "vnet_id" {
  description = "The ID of the virtual network"
  value = azurerm_virtual_network.vnet[0].id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value = local.subnets
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.nsg.id
}

output "public_ip_id" {
  description = "The ID of the public IP"
  value = azurerm_public_ip.public_ip[0].id
}

