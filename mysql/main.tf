# Creation d'un groupe de ressource
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
  timeouts {
    create = "1m"
  }
}

# # Creation d'une base de données mariadb
# resource "azurerm_mariadb_server" "db" {
#   name                = "${var.resource_prefix}mdb"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   sku_name = "B_Gen5_2"

#   storage_mb                   = 51200
#   backup_retention_days        = 7
#   geo_redundant_backup_enabled = false

#   administrator_login          = var.admin_login
#   # administrator_login_password = data.azurerm_key_vault_secret.admin_password.value
#   administrator_login_password = var.admin_login_password
#   version                      = "10.2"
#   ssl_enforcement_enabled      = false
# }

# # Creation d'une regle de firewall mariadb 1
# resource "azurerm_mariadb_firewall_rule" "fw1" {
#   name                  = "${var.resource_prefix}-accesazure"
#   resource_group_name   = azurerm_resource_group.rg.name
#   server_name           = azurerm_mariadb_server.db.name
#   start_ip_address      = "0.0.0.0"
#   end_ip_address        = "0.0.0.0"
# }

# # Creation d'une regle de firewall mariadb 2
# resource "azurerm_mariadb_firewall_rule" "fw2" {
#   name                  = "${var.resource_prefix}-accesdesktop"
#   resource_group_name   = azurerm_resource_group.rg.name
#   server_name           = azurerm_mariadb_server.db.name
#   start_ip_address      = "92.143.71.165"
#   end_ip_address        = "92.143.71.165"
# }

# #Creation d'une database mariadb
# resource "azurerm_mariadb_database" "example" {
#   name                = "${var.resource_prefix}dev${format("%02d",count.index+1)}"
#   resource_group_name = azurerm_resource_group.rg.name
#   count               = var.database_count
#   server_name         = azurerm_mariadb_server.db.name
#   charset             = "utf8mb4"
#   collation           = "utf8mb4_unicode_520_ci"
  # 
  # #test local-exec peut etre utilisable pour passer des valeurs de terraform vers le fichier texte
  # provisioner "local-exec" {
  # command = "echo 'helloworld'${count.index} >> testecho.txt"
  # }
# }


# #Creation d'une database mariadb
# resource "azurerm_mariadb_database" "example2" {
#   name                = "${var.resource_prefix}prod${format("%02d",count.index+1)}"
#   resource_group_name = azurerm_resource_group.rg.name
#   count               = var.database_count
#   server_name         = azurerm_mariadb_server.db.name
#   charset             = "utf8mb4"
#   collation           = "utf8mb4_unicode_520_ci"
# }

# #Creation d'un keyvault
# data "azurerm_client_config" "current" {}

# resource "azurerm_key_vault" "example" {
#   name                        = "${var.resource_prefix}-kv"
#   location                    = azurerm_resource_group.rg.location
#   resource_group_name         = azurerm_resource_group.rg.name
#   enabled_for_disk_encryption = false
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = false

#   sku_name = "standard"

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     key_permissions = [
#       "Get",
#     ]

#     secret_permissions = [
#       "Get","List","Set","Get","List","Set","Delete"
#     ]

#     storage_permissions = [
#       "Get",
#     ]
#   }
# }

# # astuce temporaire pour dependence du script bash en attendant debug
# resource "null_resource" "prev" {}

# resource "time_sleep" "wait_249_seconds" {
#   depends_on = [null_resource.prev]

#   create_duration = "249s"
# }

# #test lancement script bash
# resource "null_resource" "loopbash" {
#   depends_on  = [time_sleep.wait_249_seconds]
#   provisioner "local-exec" {
#     command = "bash loopdatabases.sh"
#   }
# }

