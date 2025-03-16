provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    # Azure Resource Manager
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>4.23.0"
    }
  }
  # Required version of Terraform
  required_version = ">1.11.0"
}
