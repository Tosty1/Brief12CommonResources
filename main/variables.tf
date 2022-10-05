variable "resource_group_name" {
  type    = string
  default = "TestingCM"
}

variable "resource_group_location" {
  type    = string
  default = "westeurope"
}

variable "resource_pfx" {
  type    = string
  default = "b12cr"
}

variable "admin_login" {
  type    = string
  default = "adminLogin1"
}

variable "database_count" {
  type    = number
  default = 10
}

#Variables pour le groupe Storage

variable "storage_account_name" {
    default = "brief12storageaccount"
    type    = string
}

variable "container_name_pfx" {
  description = "Containers Names"
  default     = "groupe"
  type        = string
}

variable "container_count" {
  description = "Number of container"
  default     = 10
  type        = number
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