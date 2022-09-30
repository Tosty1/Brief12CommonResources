variable "resource_group_name" {
  type    = string
  default = "Brief12CommonResources"
}

variable "resource_group_location" {
  type    = string
  default = "westeurope"
}

variable "resource_pfx" {
  type    = string
  default = "b12pa"
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
    default = "Brief12StorageAccount"
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