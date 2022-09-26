
terraform {
   required_providers {
     azurerm = {       # Specify what version of the provider we are going to utilise
       source  = "hashicorp/azurerm"
       version = ">= 3.23.0"     }
     sendgrid = {
       source  = "Trois-Six/sendgrid"
       version = "= 0.2.1" 
    }
   }
 }

provider "azurerm" {
  # Configuration options
  features {}
}

provider "sendgrid" {
  # Configuration options
  api_key = var.api_key
}
