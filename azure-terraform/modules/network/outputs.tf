output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet[0].id
}

output "subnet_ids" {
  value = { for k, s in azurerm_subnet.subnet : k => s.id }
}

output "subnets_id_list" {
  value = local.subnets
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.nsg.id
}

output "public_ip_id" {
  description = "The ID of the public IP"
  value       = azurerm_public_ip.public_ip[0].id
}

output "vnet_public_ip_address" {
  description = "The public IP address"
  value       = azurerm_public_ip.public_ip[0].ip_address
}
