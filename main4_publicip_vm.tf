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

