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
  address_space       = var.address_space

  # Virtual network
  vnet_name = var.vnet_name

  # Subnets
  subnets          = var.subnets
  create_public_ip = var.create_public_ip
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
  vnet_subnet_id = module.network.subnet_ids[var.subnet_name]

  # Public IP
  public_id = module.network.public_ip_id
  # network
  ssh_public_key_path = var.ssh_public_key_path
}
