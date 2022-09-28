
# Creation mysql server

resource "azurerm_mysql_server" "p20cloud" {
  name                = "${var.resource_pfx}mysql"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name = "GP_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  administrator_login          = var.admin_login
  administrator_login_password = var.admin_login_password
  version                      = "5.7"
  ssl_enforcement_enabled      = true

  depends_on = [azurerm_resource_group.rg]
}

#######################################################################
# Creation régles firewall

resource "azurerm_mysql_firewall_rule" "p20cloud" {
  name                = "office_rule"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.p20cloud.name
  start_ip_address    = data.http.myip.body
  end_ip_address      = data.http.myip.body

  depends_on = [azurerm_mysql_server.p20cloud]
}

resource "azurerm_mysql_firewall_rule" "p20cloud2" {
  name                = "allow_access"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.p20cloud.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"

  depends_on = [azurerm_mysql_server.p20cloud]
}

#######################################################################
# Creation de base de données mysql

resource "azurerm_mysql_database" "p20clouddev" {
  name                = "${var.resource_pfx}dev${format("%02d",count.index+1)}"
  resource_group_name = var.resource_group_name
  count               = var.database_count
  server_name         = azurerm_mysql_server.p20cloud.name
  charset             = "utf8"
  collation           = "utf8_unicode_520_ci"


  depends_on = [azurerm_mysql_firewall_rule.p20cloud]
}
resource "azurerm_mysql_database" "p20cloudprod" {
  name                = "${var.resource_pfx}prod${format("%02d",count.index+1)}"
  resource_group_name = var.resource_group_name
  count               = var.database_count
  server_name         = azurerm_mysql_server.p20cloud.name
  charset             = "utf8"
  collation           = "utf8_unicode_520_ci"


  depends_on = [azurerm_mysql_firewall_rule.p20cloud]
}

#######################################################################
# Creation des users du serveur mysql

resource "mysql_user" "p20clouddev" {
  user               = "${var.resource_pfx}devuser${format("%02d",count.index+1)}"
  host               = "%"
  plaintext_password = random_string.dbpassword[count.index].result
  count              = var.database_count

  depends_on = [azurerm_mysql_firewall_rule.p20cloud, random_string.dbpassword]
}
resource "mysql_user" "p20cloudprod" {
  user               = "${var.resource_pfx}produser${format("%02d",count.index+1)}"
  host               = "%"
  plaintext_password = random_string.dbpassword[count.index+10].result
  count              = var.database_count

  depends_on = [azurerm_mysql_firewall_rule.p20cloud, random_string.dbpassword]
}

#######################################################################
# Ajout des privileges aux users db mysql

resource "mysql_grant" "p20clouddev" {
  user       = "${var.resource_pfx}devuser${format("%02d",count.index+1)}"
  host       = "%"
  database   = "${var.resource_pfx}dev${format("%02d",count.index+1)}"
  privileges = ["SELECT", "UPDATE", "DELETE", "EXECUTE", "INSERT"]
  count      = var.database_count

  depends_on = [mysql_user.p20clouddev, azurerm_mysql_database.p20clouddev]

# alimentation du fichier texte avec infos login
 
  provisioner "local-exec" {
  command = "echo user '${var.resource_pfx}devuser${format("%02d",count.index+1)}  database ${var.resource_pfx}dev${format("%02d",count.index+1)} password ${random_string.dbpassword[count.index].result}' >> infodb.txt"
  }
}

resource "mysql_grant" "p20cloudprod" {
  user       = "${var.resource_pfx}produser${format("%02d",count.index+1)}"
  host       = "%"
  database   = "${var.resource_pfx}prod${format("%02d",count.index+1)}"
  privileges = ["SELECT", "UPDATE", "DELETE", "EXECUTE", "INSERT"]
  count      = var.database_count

  depends_on = [mysql_user.p20cloudprod, azurerm_mysql_database.p20cloudprod]

# alimentation du fichier texte avec infos login

  provisioner "local-exec" {
  command = "echo user '${var.resource_pfx}produser${format("%02d",count.index+1)}  database ${var.resource_pfx}prod${format("%02d",count.index+1)}  password ${random_string.dbpassword[count.index+10].result}' >> infodb.txt"
  }
}

#######################################################################
# Creation des passwords

resource "random_string" "dbpassword" {
  length  = 15
  special = false
  count   = 20
}

