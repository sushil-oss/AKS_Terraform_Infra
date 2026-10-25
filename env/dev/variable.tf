variable "rg"{
    type = map(object({
        name     = string
        location = string
    }))  
}

variable "aks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string

    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })

    identity = object({
      type = string
    })

    tags = object({
      Environment = string
    })
  }))
}

variable "output" {
  type = object({
    client_certificate = object({
      value     = string
      sensitive = bool
    })
    kube_config = object({
      value     = string
      sensitive = bool
    })
  })
}
