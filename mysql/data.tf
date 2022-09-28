# data "azurerm_key_vault" "key_vault"{
#     name                = "${var.resource_pfx}-kv"
#     resource_group_name = azurerm_resource_group.rg.name
# }

# data "azurerm_key_vault_secret" "admin_password" {
#     name            = "admin-password"
#     key_vault_id    = data.azurerm_key_vault.key_vault.id
# }

data "http" "myip" {
  url = "http://ifconfig.me/ip"
}