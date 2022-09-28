variable "resource_group_name" {
  type = string
  default = "perso-alain" 
}

variable "resource_group_location" {
  type = string
  default = "westeurope"
}

variable "resource_pfx" {
  type = string
  default = "b12pa"
}

variable "admin_login" {
  type = string
  default = "adminLogin1"
}

variable "admin_login_password" {
  type = string
  default = "adminPass1"
}

variable "database_count" {
  type = number
  default = 10
}
