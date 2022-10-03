# <p align="center"><img src="https://img.icons8.com/fluency/48/000000/azure-1.png"/> Azure common resources with Terraform<img src="https://img.icons8.com/fluency/48/000000/terraform.png"/></p>

## Brief 12 - Partie 1 - un cloud pour la communauté

### Automatisation de la création de service bus, base de données, container de stockage et service mail via Terraform. 

Ce projet prépare les ressources pour chaque binôme de la partie 2 du brief,  il y en aura 10.
De ce fait les ressources suivantes seront générées :

* [10 queues de PROD et 10 queues de DEV dans le service bus](servicebus.md)
* [10 bases de données de PROD et 10 base de données DEV avec chacune un utilisateur et un mot de passe propre](mariadb.md)
* [10 container de stockage contenant chacun un répertoire PROD et DEV](storage.md)
* [1 service d'envoi de MAIL Send Grid correctement configuré.](sendgrid.md)


---
![diagram](https://github.com/P20CloudAzure/Brief12CommonResources/blob/mariadb/mariadb/images/diagramv1.jpg)

---
### <img src="https://img.icons8.com/cotton/40/000000/settings--v1.png"/>	Guide d'installation

- Prerequis :

	- avoir installé terraform [guide d'installation](https://learn.hashicorp.com/tutorials/terraform/install-cli)

	- pouvoir se connecter via Azure cli avec `az login` [guide de connexion](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli)


1. cloner ce repos : 
	- `git clone https://github.com/P20CloudAzure/Brief12CommonResources.git`
2. Se rendre dans le dossier Brief12CommonResources
3. S'assurer que les variables correspondent à vos besoins dans le fichier variables.tf
4. Puis entrer les commandes terraform suivantes dans votre terminal, pour initialiser terraform, planifier et appliquer le plan:
	- `terraform init`  
	- `terraform plan`
	- `terraform apply --auto-approve`

5. Après quelques minutes vos ressources auront été crées et votre dossier brief12CommonResources contiendra les fichiers d'informations supplémentaire suivants:
	- servicebus.txt (contient clés ....)
	- mariadb.txt (contient nom logins et pass utilisateurs mysql )
	- mycert.crt.pem (certificat ssl pour la base de données)
	- storage.txt (contient clés sas storage)
	- sendgrid.txt (contier ....)
	
6. Les ressources sont à votre disposition, pour plus de details, merci de suivre les liens vers les readme specifiques à chaque ressource, disponibles  un peu plus haut.

---
### <img src="https://img.icons8.com/external-flaticons-lineal-color-flat-icons/40/000000/external-contribution-achievements-flaticons-lineal-color-flat-icons.png"/>Contributing
- Ceci est un projet étudiant, les pull requests ne provenant pas des éléves de la promo 20 cloud Simplon sont refusées pour le moment. 
- Merci d'ouvrir une issue en premier pour discuter les changement que vous voudriez apporter avant de pull request.

---
### <img src="https://img.icons8.com/external-flaticons-flat-flat-icons/40/000000/external-fire-extinguisher-wayfinding-flaticons-flat-flat-icons.png"/>Known issues (work in progress)

C'est un projet en cours de developement.
- Les resources sont crées sur azure, pour d'autre fournisseur cloud il faut modifier le code.
- La sécurisation des données via l'utilisation d'un keyvault reste à faire.
