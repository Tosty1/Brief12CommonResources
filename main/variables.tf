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
