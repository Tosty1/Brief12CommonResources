
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.24.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}

######################################################################
#Variables for terraform

locals {
  resource_group = "driton_perso"
  location       = "northeurope"
  mmysql_name    = "mysqlpromocloud"
}

#################################################################
# Creation d'un groupe de ressource
resource "azurerm_resource_group" "p20cloud" {
  name     = local.resource_group
  location = local.location

  timeouts {
    create = "1m"
  }
}

##########################################################################
###Mysql server

resource "azurerm_mysql_server" "mysqltony" {
  name                         = local.mmysql_name
  location                     = local.location
  resource_group_name          = local.resource_group
  administrator_login          = "dritongorani"
  administrator_login_password = "Tony123456."

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false
  ssl_minimal_tls_version_enforced  = "TLS1_2"

  depends_on = [
    azurerm_resource_group.p20cloud
  ]

  timeouts {
    create = "4m"
    update = "2m"
  }

}


#####Firewall rule##############################
resource "azurerm_mysql_firewall_rule" "firewallrule" {
  name                = "tonyips"
  resource_group_name = local.resource_group
  server_name         = local.mmysql_name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"


  depends_on = [
    azurerm_mysql_server.mysqltony
  ]
}



data "http" "myip" {
  url = "http://ifconfig.me/ip"

}
resource "azurerm_mysql_firewall_rule" "mysql_firewall_clientip" {
  name                = "ClientIpAddress"
  resource_group_name = local.resource_group
  server_name         = local.mmysql_name
  start_ip_address    = chomp(data.http.myip.body)
  end_ip_address      = chomp(data.http.myip.body)
}


################################################################
##Mysql database

resource "azurerm_mysql_database" "example" {
  name                = "databasetest"
  resource_group_name = local.resource_group
  server_name         = local.mmysql_name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
  depends_on = [
    azurerm_mysql_server.mysqltony
  ]

  timeouts {
    create = "1m"
  }
}

#######################################################################


