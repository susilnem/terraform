# Setting version and provider
terraform {
  required_version = ">1.11.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.23.0"
    }
  }
}

# Local vvariable
locals {
  subnets = [
    for subnet in azurerm_subnet.subnet :
    {
      name = subnet.name
      id   = subnet.id
    }
  ]
}

# Virtual network
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

resource "azurerm_virtual_network" "vnet" {
  count               = var.vnet_name == null ? 0 : 1
  name                = "${var.vnet_name}-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

# Subnet
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet

resource "azurerm_subnet" "subnet" {
  for_each = var.subnets

  name                 = each.value.name
  virtual_network_name = azurerm_virtual_network.vnet[0].name
  resource_group_name  = var.resource_group_name
  address_prefixes     = each.value.address_prefixes
  service_endpoints    = each.value.service_endpoints

  dynamic "delegation" {
    for_each = each.value.service_delegations
    content {
      name = delegation.key

      service_delegation {
        name    = delegation.value.name
        actions = delegation.value.actions
      }
    }
  }

  depends_on = [azurerm_virtual_network.vnet]
}


# Network security group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group

resource "azurerm_network_security_group" "nsg" {

  name                = "${var.vnet_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.security_rules

    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

# Public IP
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip

resource "azurerm_public_ip" "public_ip" {
  count               = var.create_public_ip ? 1 : 0
  name                = "${var.vnet_name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.create_public_ip ? "Static" : "Dynamic"
  sku                 = "Standard"
}

# Azure Route Table
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table

resource "azurerm_route_table" "route_table" {
  count               = length(var.route_tables)
  name                = "${var.route_tables[count.index].name}-route-table"
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "route" {
    for_each = var.route_tables

    content {
      name                   = route.value.name
      address_prefix         = route.value.address_prefix
      next_hop_type          = route.value.next_hop_type
      next_hop_in_ip_address = route.value.next_hop_in_ip_address
    }
  }
}
