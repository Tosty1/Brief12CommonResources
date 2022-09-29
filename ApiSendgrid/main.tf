resource "sendgrid_api_key" "api_key" {
  name = var.nameapi
  scopes = [
    "api_keys.create", #pas sur d'utilisation
    "api_keys.delete", #pas sur d'utilisation
    "api_keys.read",   #pas sur d'utilisation
    "api_keys.update", #pas sur d'utilisation   
    "mail.batch.create",
    "mail.batch.delete",
    "mail.batch.read",
    "mail.batch.update",
  "mail.send"]

}
