# Resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Networking
module "networking" {
  source = "./modules/networking"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  # Virtual network
  vnet_name     = var.vnet_name

  # Subnets
  subnet_name           = var.subnet_name
} 