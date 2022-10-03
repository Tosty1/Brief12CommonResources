terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.21.1"
    }
  }
}

provider "azurerm" {
  features {}
}


#######################################################################

#Variables for terraform

locals {
  resource_group        = "perso_driton"
  location              = "northeurope"
  mariadb_name          = "mariadbtest"
  mariadb_user          = "jermtest"
  mariadb_user_password = "passjeremtest"
}

#################################################################



# Creation d'un groupe de ressource
resource "azurerm_resource_group" "p20cloud" {
  name     = local.resource_group
  location = local.location
}


# Creation mariadb server
resource "azurerm_mariadb_server" "p20cloud" {
  name                = local.mariadb_name
  location            = local.location
  resource_group_name = local.resource_group

  sku_name = "B_Gen5_2"

  storage_mb                   = 51200
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  administrator_login          = "bud"
  administrator_login_password = "Promo20cloud"
  version                      = "10.2"
  ssl_enforcement_enabled      = true
}


#Creation d'une base de donnée mariadb
resource "azurerm_mariadb_database" "P21cloud" {
  name                = "database_test"
  resource_group_name = local.resource_group
  server_name         = local.mariadb_name
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_520_ci"
}


resource "mariadb_user" "P21cloud" {
  user = local.mariadb_user
}

resource "mariadb_user_password" "P21cloud" {
  user    = local.mariadb_user
  pgp_key = local.mariadb_user_password
}


