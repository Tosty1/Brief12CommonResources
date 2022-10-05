# CommonResources
variable "resource_group_name" {
  type    = string
  default = "TestcdsmBrief12"
}

variable "resource_group_location" {
  type    = string
  default = "westeurope"
}

#Variables pour le groupe Mariadb
variable "resource_pfx" {
  type    = string
  default = "testb12paaaa"
}

variable "admin_login" {
  type    = string
  default = "testadminLogin1"
}

variable "database_count" {
  type    = number
  default = 10
}

#Variables pour le groupe Storage

variable "storage_account_name" {
    default = "testb12storageaccount"
    type    = string
}

variable "container_name_pfx" {
  description = "Containers Names"
  default     = "testgroupe"
  type        = string
}

variable "container_count" {
  description = "Number of container"
  default     = 10
  type        = number
}

# variable pour le groupe service bus

variable "servicebus_name" {

  default = "testbrief12-ServiceBus"
  type    = string

}

# Variable des Queues 

variable "queue_count" {

  default     = 10
  type        = number
  description = "Queue number"

}

variable "queue_prod" {

  default     = "testProd"
  type        = string
  description = "Queue names"
}


variable "queue_dev" {

  default     = "testDev"
  type        = string
  description = "Queue names"
}

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
