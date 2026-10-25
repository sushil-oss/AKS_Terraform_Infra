resource "azurerm_kubernetes_cluster" "aks" {
  for_each            = var.aks
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = each.value.default_node_pool.name
    node_count = each.value.default_node_pool.node_count
    vm_size    = each.value.default_node_pool.vm_size
  }

  identity {
    type = each.value.identity.type
  }

  tags = {
    Environment = each.value.tags.Environment
  }
}

output "client_certificate" {
  value     = { for k, v in azurerm_kubernetes_cluster.aks : k => v.kube_config[0].client_certificate }
  sensitive = true
}

output "kube_config" {
  value     = { for k, v in azurerm_kubernetes_cluster.susaks : k => v.kube_config_raw }
  sensitive = true
}