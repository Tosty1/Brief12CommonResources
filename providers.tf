
terraform {
  required_providers {
    azurerm = { # Specify what version of the provider we are going to utilise
      source = "hashicorp/azurerm"
    version = ">= 3.23.0" }
    sendgrid = {
      source = "Trois-Six/sendgrid"
    version = "= 0.2.1" }

  }
}

#mise en place de la route princapele pour avoir accès au bon tenant
provider "azurerm" {
  # Configuration options
  features {}

  subscription_id = "8bf7ae65-43e6-473a-b524-abce50a459ce"
  client_id       = "4acd945c-fef4-4e37-83b9-320929d6585b"
  client_secret   = var.client_secret
  tenant_id       = "9627bf4d-eeb1-44ef-a2c9-55b80d71fab1"
}

#entrée de la clèfs d'api ADMIN pour pouvoir s'authentifier a sengrid et crée la clès dont nous aurons besoin
provider "sendgrid" {
  # Configuration options
  api_key = var.api_keyADMIN
}







