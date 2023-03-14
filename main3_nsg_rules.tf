# network security group
resource "azurerm_network_security_group" "tf-nsg" {
  name                = "tf-nsg"
  location            = azurerm_resource_group.tf-rg.location
  resource_group_name = azurerm_resource_group.tf-rg.name

  tags = {
    environment = "dev"
  }
}
