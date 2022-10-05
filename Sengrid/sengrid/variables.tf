#Variables du groupe Sendgrid

variable "api_keyADMIN" {
  type        = string
  description = "testapi key admin pour le providers"
}

variable "api_to_completed" {
  type =  string
  description = "veuillez entrer votre clef d'api ADMIN:"
}

variable "nameapi" {
  type =  string
  description = "nom de l'api qui va être crée"
}

variable "api_key" {
  type        = string
  description = "api key récupérer"
}

variable "app_domain" {
  type        = string
  description = "nom de domaine ajouté"
}


variable "dnsname1" {
  type        = string
  description = "nom dns zone 1"

}

variable "dnsname2" {
  type        = string
  description = "nom dns zone 2"

}

variable "dnsname3" {
  type        = string
  description = "nom dns zone 3"

}

variable "record1" {
  type        = string
  description = "recorder n.1"

}

variable "record2" {
  type        = string
  description = "recorder n.2"

}

variable "record3" {
  type        = string
  description = "recorder n.3"

}
