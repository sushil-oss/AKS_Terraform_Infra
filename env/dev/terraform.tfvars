rg = {
  rg1 = {
    name     = "sushil-rg"
    location = "East US"
  }
}

aks = {
  aks1 = {
    name                = "aks1"
    location            = "East US"
    resource_group_name = "sushil-rg"
    dns_prefix          = "aks1"

    default_node_pool = {
      name       = "default"
      node_count = 1
      vm_size    = "Standard_D2_v2"
    }

    identity = {
      type = "SystemAssigned"
    }

    tags = {
      Environment = "Production"
    }
  }
}