# Documentation database mysql

## Sommaire
>- Objectifs
>- Graph
>- Definition des providers
>- Ressources communes
>- Ressources mysql
>- Ressources diverses
>- Get it started

---
## Objectif
- Mise en place d'un serveur de base de données Mysql via Terraform avec
    - 10 bases de données DEV et 10 base de données PROD 
    - avec chacune un utilisateur, un mot de passe propre et priviléges exclusifs

---
## Graph des dépendances
![graphDB.png](/mysql/images/graphDB.png)

---
## Definition des providers

- azurerm = requis pour ressources azure
    - source  = "hashicorp/azurerm"
    - version = "3.21.1"

- random = requis pour passwords aléatoires
    - source  = "hashicorp/random"
    - version = ">= 3.4.3"

- mysql = requis pour ressources mysql
    - source  = "petoju/mysql"
    - version = "3.0.20"

- local = requis pour generer fichier local
    - source = "hashicorp/local"
    - version = "2.2.3"

- http = download data http
    - source = "hashicorp/http"
    - version = "3.1.0"

---
## Ressources communes
- resource "azurerm_resource_group" "p20cloud" &rarr; création du groupe azure Brief12CommonResources

---
## Ressources mysql

- resource "azurerm_mysql_server" "p20cloud"  &rarr; création du serveur mysql
    - avec ssl

- resource "azurerm_mysql_firewall_rule" x 2  &rarr; régle de firewall accés service azure et ip admin determiné

- resource "azurerm_mysql_database" x 2  &rarr; création des 10 databases dev et prod
    - utilisation de boucle count

- resource "mysql_user" x 2  &rarr; création des users de databases dev et prod
    - utilisation de boucle count

- resource "mysql_grant" x 2  &rarr; gestion des priviléges sur database pour chaque user dev et prod
    - utilisation de boucle count

---
## Ressources diverses

- resource "random_string" &rarr; generation de password complexe
- resource "null_resource" pour execution de commande shell avec provisioner "local-exec"
- data "http" "myip"  &rarr; pour récuperation ip de l'executant du script terraform via url = "http://ifconfig.me/ip"
- data "http" "downloadcert"  &rarr; pour récuperation certificat via url = "https://cacerts.digicert.com/BaltimoreCyberTrustRoot.crt.pem"
- resource "local_file" "export" x 2 &rarr; alternative au provisioner "local-exec" pour generer fichiers locaux d'infos et certificat

---
## Get it started
```bash
terraform init
terraform plan
terraform apply --auto-approve
```
- un fichier infosDB.txt est généré avec les informations de login, password et database.
- un certificat ssl mycert.crt.pem est généré localement
- pour se connecter au serveur mysql en ligne de commande entrer la commande suivante dans le terminal:

`mysql --user=<nom utilisateur> --password=<password> --host=<nom du serveur mysql>.mysql.database.azure.com --ssl-ca=<nom du certificat>`