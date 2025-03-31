# Virtual network
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

resource "azurerm_virtual_network" "vnet" {
    name = "${format("%s-vnet", var.vnet_name)}"
    location = var.location
    resource_group_name = var.resource_group_name
    address_space = var.address_space
}

# Subnet
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet

resource "azurerm_subnet" "subnets" {
    name = "${format("%s-subnet", var.vnet_name)}"
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = var.address_prefixes
    service_endpoints = var.service_endpoints
}


# Network security group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group

resource "azurerm_network_security_group" "nsg" {

    name = "${var.vnet_name}-nsg"
    location = var.location
    resource_group_name = var.resource_group_name

    dynamic "security_rule" {
        for_each = var.security_rules

        content {
            name = security_rule.value.name
            priority = security_rule.value.priority
            direction = security_rule.value.direction
            access = security_rule.value.access
            protocol = security_rule.value.protocol
            source_port_range = security_rule.value.source_port_range
            destination_port_range = security_rule.value.destination_port_range
            source_address_prefix = security_rule.value.source_address_prefix
            destination_address_prefix = security_rule.value.destination_address_prefix
        }
      
    }
}

# Public IP
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip

resource "azurerm_public_ip" "public_ip" {
    name = "${var.vnet_name}-public-ip"
    location = var.location
    resource_group_name = var.resource_group_name
    allocation_method = var.allocation_method
}

resource "azurerm_network_interface" "nic" {
    name = "${var.vnet_name}-nic"
    location = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name = "internal"
        subnet_id = azurerm_subnet.subnets.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.public_ip.id
    }
}

# Azure Route Table
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table

resource "azurerm_route_table" "route_table" {
    count = length(var.route_tables)
    name = "${var.route_tables[count.index].name}-route-table"
    location = var.location
    resource_group_name = var.resource_group_name
    tags = var.route_tables[count.index].tags

    dynamic "route" {
        for_each = var.route_tables[count.index].routes

        content {
            name = route.value.name
            address_prefix = route.value.address_prefix
            next_hop_type = route.value.next_hop_type
            next_hop_in_ip_address = route.value.next_hop_ip_address
        }
    }
}