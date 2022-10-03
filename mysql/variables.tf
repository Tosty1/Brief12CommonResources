
# serviceBus

# variable pour le groupe service bus

variable "servicebus_name" {

  default = "brief12-ServiceBus"
  type    = string
<<<<<<< HEAD:main/variables.tf

=======
  default = "perso-alain"
>>>>>>> origin/mariadb:mysql/variables.tf
}

# Variable des Queues 

variable "queue_count" {

  default     = 10
  type        = number
  description = "Queue number"

}

<<<<<<< HEAD:main/variables.tf
variable "queue_prod" {

  default     = "Prod"
  type        = string
  description = "Queue names"
=======
variable "resource_pfx" {
  type    = string
  default = "b12pa"
>>>>>>> origin/mariadb:mysql/variables.tf
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
