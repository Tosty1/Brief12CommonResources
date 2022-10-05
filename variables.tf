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

  default = "testb12-ServiceBus"
  type    = string

}

# Variable des Queues 

variable "queue_count" {

  default     = 10
  type        = number
  description = "Queue number"

}

variable "queue_prod" {

  default     = "Prod"
  type        = string
  description = "Queue names"
}


variable "queue_dev" {

  default     = "Dev"
  type        = string
  description = "Queue names"
}

# Variables des autorisations

variable "autorisation_count" {

  default     = 10
  type        = number
  description = "Autorisation number"

}

