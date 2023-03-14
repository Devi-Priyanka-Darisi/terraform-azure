# public ip
resource "azurerm_public_ip" "tf-nsg-pip" {
  name                = "tf-nsg-pip"
  resource_group_name = azurerm_resource_group.tf-rg.name
  location            = azurerm_resource_group.tf-rg.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "dev"
  }
}

# network interface
resource "azurerm_network_interface" "tf-nic" {
  name                = "tf-nic"
  location            = azurerm_resource_group.tf-rg.location
  resource_group_name = azurerm_resource_group.tf-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.tf-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tf-nsg-pip.id
  }

  tags = {
    environment = "dev"
  }
}
