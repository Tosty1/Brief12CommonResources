#mise en place du dernier provider stable
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.21.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

#Groupe de resource et location geré dans le fichier variables.tf
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
