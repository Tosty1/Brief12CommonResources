# serviceBus

# variable pour le groupe service bus

variable "servicebus_name" {

  default = "brief12-ServiceBus"
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


variable "autorisation_count" {

  default     = 10
  type        = number
  description = "Autorisation number"

}
