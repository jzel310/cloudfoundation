resource "azurerm_resource_group" "rg" {
  name     = "aks-cluster-${var.name}"
  location = "eastus"
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name       = "aks-${var.name}"
  location   = azurerm_resource_group.rg.location
  dns_prefix = "aks"

  resource_group_name = azurerm_resource_group.rg.name
  kubernetes_version  = "1.27.3"

  default_node_pool {
    name       = "aks"
    node_count = "2"
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "helm_release" "ingress" {
  name       = "ingress"
  repository = "https://kubernetes.github.io/ingress-nginx/"
  chart      = "ingress-nginx"

  set {
    name  = "rbac.create"
    value = "true"
  }
}

