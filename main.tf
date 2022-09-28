
resource "azurerm_resource_group" "Aleeytest" {
name     = var.resource_group_name
location = var.resource_group_location
}

# whit this code the API will be able just to send emails  if you need to add another options go the website 
# https://docs.sendgrid.com/api-reference/api-key-permissions/api-key-permissions#mail
resource "sendgrid_api_key" "api_key" {
    name   = var.api_key
    scopes = [
     "api_keys.create",     #pas sur d'utilisation
     "api_keys.delete",     #pas sur d'utilisation
     "api_keys.read",       #pas sur d'utilisation
     "api_keys.update",     #pas sur d'utilisation   
     "mail.batch.create",
     "mail.batch.delete",
     "mail.batch.read",
     "mail.batch.update",
     "mail.send"
    ]
}


resource "sendgrid_domain_authentication" "default" {
  domain            = var.app_domain
  is_default         = true
  automatic_security = false
}

resource "azurerm_dns_cname_record" "CName1" {
  name                = var.dnsname1
  zone_name           = var.app_domain
  resource_group_name = var.resource_group_name
  ttl                 = 3600
  record              = var.record1
}

resource "azurerm_dns_cname_record" "CName2" {
  name                = var.dnsname2
  zone_name           = var.app_domain
  resource_group_name = var.resource_group_name
  ttl                 = 3600
  record              = var.record2
}

resource "azurerm_dns_cname_record" "CName3" {
  name                =  var.dnsname3
  zone_name           =  var.app_domain
  resource_group_name = var.resource_group_name
  ttl                 = 3600
  record              = var.record3
}