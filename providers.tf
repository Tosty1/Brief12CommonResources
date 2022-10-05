terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.21.1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.3"
    }
    mysql = {
      source  = "petoju/mysql"
      version = "3.0.20"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

provider "mysql" {
  endpoint = "${var.resource_pfx}mysql.mysql.database.azure.com:3306"
  username = "${azurerm_mysql_server.p20cloud.administrator_login}@${var.resource_pfx}mysql"
  password = azurerm_mysql_server.p20cloud.administrator_login_password
  tls      = true
}

provider "local" {
  # Configuration options
}

terraform {
  required_providers {
    sendgrid = {
      source  = "Trois-Six/sendgrid"
      version = "0.2.1"
    }
  }
}

provider "sendgrid" {
  api_key = var.api_to_completed
  # Configuration options
}