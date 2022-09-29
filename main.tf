
resource "azurerm_resource_group" "sendgrid" {
name     = var.resource_group_name
location = var.resource_group_location
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