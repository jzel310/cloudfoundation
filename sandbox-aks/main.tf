module "sandbox_cluster" {
  source = "../aks"
  name   = "sandbox"
}

output "kubeconfig_sandbox" {
  value     = module.sandbox_cluster.kube_config
  sensitive = true
}
