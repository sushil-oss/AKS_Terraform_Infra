module "resource_group" {
    source = "../../module/rg"
    rg     = var.rg  
}

module "aks" {
    depends_on = [module.resource_group]
    source = "../../module/aks"
    aks    = var.aks
    output = var.output
    
}
    