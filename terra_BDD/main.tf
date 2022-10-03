
# Creation d'un groupe de ressource

resource "azurerm_resource_group" "p20cloud" {
  name     = var.resource_group
  location = var.location
}
