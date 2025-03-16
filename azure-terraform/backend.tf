# Create a storage account and a container to store the terraform state file

terraform {
  backend "azurerm" {
    resource_group_name   = "susilnemterraformstate-rg"
    storage_account_name  = "susilnemtfstate"
    container_name        = "terraform"
    key                   = "playground.tfstate"
  }
}