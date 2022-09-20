

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.23.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
    
  }
}


##################################################################
#Variables for terraform

variable "resource_group_name" {
  type = string
  description = "Entrer le nom de groupe de ressource?"
  
}



variable "azurerm_mariadb_server" {
  type = string
  description = "Entrer votre nom de Mariadb?"
  
}
#################################################################



# Creation d'un groupe de ressource
resource "azurerm_resource_group" "p20cloud" {
  name     = var.resource_group_name
  location = "West Europe"
}


# Creation d'un base de donnés
resource "azurerm_mariadb_server" "p20cloud" {
  name                = var.azurerm_mariadb_server
  location            = azurerm_resource_group.p20cloud.location
  resource_group_name = var.resource_group_name

  sku_name = "B_Gen5_2"

  storage_mb                   = 51200
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  administrator_login          = "acctestun"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "10.2"
  ssl_enforcement_enabled      = true
}
