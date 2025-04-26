output "resource_group_name" {
  value = azurerm_resource_group.rg.name
  description = "Azure Resource Group name"
}

output "subnet_ids" {
  value = module.network.subnet_ids
  description = "List of Subnet IDs"
}

output "network_interface_id" {
  value = module.virtual_machine.network_interface_id
  description = "Network Interface ID"
}

output "virtual_machine_id" {
  value = module.virtual_machine.vm_id
  description = "Virtual Machine ID"
}

output "vm_public_ip_address" {
  value = module.virtual_machine.vm_public_ip_address
  description = "Public IP address of the Virtual Machine"
}
output "vm_private_ip_address" {
  value = module.virtual_machine.vm_private_ip_address
  description = "Private IP address of the Virtual Machine"
}

output "vnet_id" {
  value = module.network.vnet_id
  description = "Virtual Network ID"
}

output "vnet_public_ip_address" {
  value = module.network.vnet_public_ip_address
  description = "Public IP address of the Virtual Network"
}

output "nsg_id" {
  value = module.network.nsg_id
  description = "Network Security Group ID"
}

output "public_ip_id" {
  value = module.network.public_ip_id
  description = "Network Public IP ID"
}
