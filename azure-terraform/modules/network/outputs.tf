output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet[0].id
}

output "subnet_ids" {
  value       = { for k, s in azurerm_subnet.subnet : k => s.id }
  description = "The IDs of the subnets"
}

output "subnets_id_list" {
  value       = local.subnets
  description = "The list of subnet IDs"
}

output "nsg_id" {
  value       = azurerm_network_security_group.nsg.id
  description = "The ID of the network security group"
}

output "public_ip_id" {
  value       = azurerm_public_ip.public_ip[0].id
  description = "The ID of the public IP"
}

output "vnet_public_ip_address" {
  value       = azurerm_public_ip.public_ip[0].ip_address
  description = "The public IP address"
}
