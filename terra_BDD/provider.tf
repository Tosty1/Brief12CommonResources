terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.21.1"
    }
    mysql = {
      source  = "petoju/mysql"
      version = "3.0.20"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "mysql" {
  endpoint = "${var.server_name}.mysql.database.azure.com:3306"
  username = "${azurerm_mysql_server.p20cloud.administrator_login}@${var.server_name}"
  password = azurerm_mysql_server.p20cloud.administrator_login_password
  tls      = true
}