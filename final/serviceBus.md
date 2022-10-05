
<a href="https://github.com/P20CloudAzure/Brief12CommonResources/blob/serviceBus/final" target="_blank">Notre jolie travail de groupe</a>

    **********************************************************************************************
    ************************************* #service bus ********************************************
    **********************************************************************************************
    

    ##1 - La création de service bus 
    création de service bus avec script terraform

    1- En premier en a commencer par récupérer le repo de brief sur Github
    2- apres en a crée la branche de notre groupe (service bus)
    3- Avec VScode en creer 2 fichiers .tf une pour metre les variables et l'autre pour le script
 
 

Dans le fichier script en a commencer par configurer provide azure pour terraform avec la commande suivante

provider "azurerm" {
  features {}
}

###+*avec la version azurerm 3.21.1

azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.21.1"
    }

###et en a ajouter le rendom et tls 

 random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~>4.0"
    }

  ## création de service bus
     avec avec la commend *"azurerm_servicebus_namespace"*


  *depends_on: sert a établire l'ordre dans le quele les resources doive être créer*

   ## Création des queues
     avec la commande *"azurerm_servicebus_queue"*

   pour les 10 queues dev et 10 queues prod en a utuliser  "count"

   ## Création des autorisations
     avec la commande "azurerm_servicebus_queue_authorization_rule"

     et avec les 3 régles "listen" , "send" , "manage"
     -Listen : d'autorisations d'écoute sur la file d'attente ServiceBus
     -Send   : des autorisations d'envoi à la file d'attente ServiceBus
     -Manage : des autorisations de gestion sur la file d'attente ServiceBus 

  ## Récupération des informations de l'nvironnement 

  avec {data "azurerm_servicebus_queue_authorization_rule"} et {output}
  en récupere les information des queues dev et prod et les mettre dans un fichier "dev_data.txt" a l'aide de la commande suivante {resource "local_sensitive_file"}


