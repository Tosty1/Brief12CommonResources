#
# Creation mysql server

resource "azurerm_mysql_server" "p20cloud" {
  name                = var.server_name
  location            = var.location
  resource_group_name = var.resource_group

  sku_name = "GP_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  administrator_login          = "bud"
  administrator_login_password = "Promo20cloud"
  version                      = "5.7"
  ssl_enforcement_enabled      = true

  depends_on = [azurerm_resource_group.p20cloud]
}


#create firewall rull

resource "azurerm_mysql_firewall_rule" "p20cloud" {
  name                = "office_rule"
  resource_group_name = var.resource_group
  server_name         = var.server_name
  start_ip_address    = data.http.myip.body
  end_ip_address      = data.http.myip.body

  depends_on = [azurerm_mysql_server.p20cloud]
}

resource "azurerm_mysql_firewall_rule" "p20cloud2" {
  name                = "allow_access"
  resource_group_name = var.resource_group
  server_name         = var.server_name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"

  depends_on = [azurerm_mysql_firewall_rule.p20cloud]
}


#Creation d'une base de donnée mysql

resource "azurerm_mysql_database" "p20cloud" {
  name                = "databasejytest"
  resource_group_name = var.resource_group
  server_name         = var.server_name
  charset             = "utf8"
  collation           = "utf8_unicode_520_ci"

  depends_on = [azurerm_mysql_firewall_rule.p20cloud2]
}


#Create login


resource "mysql_user" "p20cloud" {
  user               = "jeremy"
  host               = "%"
  plaintext_password = "passwordcloud"

  depends_on = [
    azurerm_mysql_database.p20cloud
  ]
}

resource "mysql_grant" "p20cloud" {
  user       = mysql_user.p20cloud.user
  host       = mysql_user.p20cloud.host
  database   = azurerm_mysql_database.p20cloud.name
  privileges = ["SELECT", "UPDATE", "DELETE", "EXECUTE", "INSERT"]

  depends_on = [mysql_user.p20cloud]
}


