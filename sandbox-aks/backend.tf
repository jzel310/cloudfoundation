
terraform {
  # required_version = ">= 1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.67.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "sandbox-demo"
    storage_account_name = "pfcsandboxdemotfstate"
    container_name       = "sandbox"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}

