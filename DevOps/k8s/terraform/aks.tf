resource "azurerm_resource_group" "aks" {
  name     = "akhlirg"
  location = "centralindia"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "firstcluster"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "myaks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }
}