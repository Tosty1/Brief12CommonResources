#Variables des ressources communes 


variable "resource_group_name" {

  default = "Brief12CommonResources"

}

variable "resource_group_location" {

  default = "westeurope"

}
#serviceBus
#variable pour le groupe service bus

variable "servicebus_namespace" {

  default = "brief12-servicebus"

}
#Variables pour le groupe Storage
variable "storage_container_name" {
    default = "Brief12StorageContainer"
}

variable "storage_account_name" {
    default = "Brief12StorageAccount"
}

#variable pour le groupe service bus




#variable pour le groupe envoi de mail


#variable pour le groupe MariaDB