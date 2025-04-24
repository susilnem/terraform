output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "subnet_ids" {
  value = module.network.subnet_ids
}

output "network_interface_id" {
  value = module.virtual_machine.network_interface_id
}

output "virtual_machine_id" {
  value = module.virtual_machine.vm_id
}

output "vm_public_ip_address" {
  value = module.virtual_machine.vm_public_ip_address
}
output "vm_private_ip_address" {
  value = module.virtual_machine.vm_private_ip_address
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "vnet_public_ip_address" {
  value = module.network.vnet_public_ip_address
}

output "nsg_id" {
  value = module.network.nsg_id
}

output "public_ip_id" {
  value = module.network.public_ip_id
}