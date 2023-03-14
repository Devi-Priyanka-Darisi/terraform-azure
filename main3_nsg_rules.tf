# network security group
resource "azurerm_network_security_group" "tf-nsg" {
  name                = "tf-nsg"
  location            = azurerm_resource_group.tf-rg.location
  resource_group_name = azurerm_resource_group.tf-rg.name

  tags = {
    environment = "dev"
  }
}

# inbound rules
resource "azurerm_network_security_rule" "tf-nsg-dev-rule" {
  name                        = "tf-nsg-dev-rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.tf-rg.name
  network_security_group_name = azurerm_network_security_group.tf-nsg.name
}

# Associating NSG with subnet
resource "azurerm_subnet_network_security_group_association" "tf-nsg-a" {
  subnet_id                 = azurerm_subnet.tf-subnet.id
  network_security_group_id = azurerm_network_security_group.tf-nsg.id
}
