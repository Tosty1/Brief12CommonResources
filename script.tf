#######################################################################
#provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.21.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
}

##################################################################
#Variables

# variable "resource_group_name" {
#   type = string
#   description = "Entrer le nom de groupe de ressource?"  
# }

# variable "azurerm_mariadb_server" {
#   type = string
#   description = "Entrer votre nom de Mariadb?"  
# }
###################################################################
#Local variables

locals {

  location          = "West Europe"
  namemariadb       = "mariadbp20cloud"
  resourcegroupname = "driton_test"
}

#################################
#Loop count variables
#################################

variable "vm_name_pfx" {
  description = "VM Names"
  default     = "test-vm-"
  type        = string
}

variable "vm_count" {
  description = "Number of Virtual Machines"
  default     = 3
  type        = string
}


#################################################################



# Creation d'un groupe de ressource
resource "azurerm_resource_group" "p20cloud" {
  name     = local.resourcegroupname
  location = local.location
}


# Creation d'une base de données mariadb
resource "azurerm_mariadb_server" "database" {
  name                = local.namemariadb
  location            = local.location
  resource_group_name = local.resourcegroupname

  sku_name = "B_Gen5_2"

  storage_mb                   = 51200
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  administrator_login          = "acctestun"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "10.2"
  ssl_enforcement_enabled      = true
}
