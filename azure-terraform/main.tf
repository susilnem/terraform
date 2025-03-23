# Resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# network
module "network" {
  source = "./modules/network"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  # Virtual network
  vnet_name = var.vnet_name

  # Subnets
  subnet_name = var.subnet_name
}

# Virtual machine
module "virtual_machine" {
  source = "./modules/virtual_machine"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  # Virtual machine
  vm_name        = var.vm_name
  vm_size        = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password

  # network
  vnet_name             = var.vnet_name
  subnet_name           = var.subnet_name
  network_interface_ids = [module.network.network_interface_id]
}