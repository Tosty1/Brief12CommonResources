

variable "app_domain" {
  type        = string
  description = "nom de domaine a ajouté"
}

variable "resource_group_name" {
  type        = string
  description = "nom du groupe de ressource"

}

variable "resource_group_location" {
  type        = string
  description = "location du rg"

}

variable "client_secret" {
  type        = string
  description = "Entrée le client secret du tenant ou vous voulez déployer l'infra."
}

variable "api_keyADMIN" {
  type        = string
  description = "Api keys admin a jouter pour l'auth a sendgrid"
}



