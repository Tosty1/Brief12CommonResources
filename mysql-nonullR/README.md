# <center><img src="https://img.icons8.com/fluency/48/000000/azure-1.png"/> Azure common resources with Terraform<img src="https://img.icons8.com/fluency/48/000000/terraform.png"/></center>

## Brief 12 - Partie 1 - un cloud pour la communauté

---
## Automatisation de la création de service bus, base de données mysql, container de stockage et service mail via Terraform. 

Ce projet prépare les ressources pour chaque binôme de la partie 2 du brief,  il y en aura 10.
De ce fait les ressources suivantes seront générées :

* [10 queues de PROD et 10 queues de DEV dans le service bus](servicebus.md)
* [10 bases de données de PROD et 10 base de données DEV avec chacune un utilisateur et un mot de passe propre](database.md)
* [10 container de stockage contenant chacun un répertoire PROD et DEV](storage.md)
* [1 service d'envoi de MAIL Send Grid correctement configuré.](sendgrid.md)


---
## Visuel diagram, gif animé ou demo 

---
## <img src="data:image/png;base64,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">	Guide d'installation

Prerequis :
	- avoir installé terraform [guide d'installation](https://learn.hashicorp.com/tutorials/terraform/install-cli)
	- pouvoir se connecter avec Azure cli avec `az login` [guide de connexion](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli)


1. cloner ce repos : 
- `git clone https://github.com/P20CloudAzure/Brief12CommonResources.git`
2. Se rendre dans le dossier Brief12CommonResources
3. S'assurer que les variables correspondent à vos besoins dans le fichier variables.tf
4. Puis entrer les commandes terraform suivantes dans votre terminal, pour initialiser terraform, planifier et appliquer le plan:
	- `terraform init`  
	- `terraform plan`
	- `terraform apply --auto-approve`

5. Après quelques minutes vos ressources auront été crées et votre dossier brief12CommonResources contiendra les fichiers d'informations supplémentaire suivants:
		- storagebus.txt (contient clés ....)
		- infosDB.txt (contient nom logins et pass utilisateurs )
		- mycert.crt.pem (certificat ssl pour la base de données)
		- storage.txt (contient clés sas storage)
		- sendgrid.txt (contier ....)
6. Les ressources sont à votre disposition, pour plus de details, merci de suivre les liens vers les readme specifiques à chaque ressource, disponibles  un peu plus haut.

---
## <img src="data:image/png;base64,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">Contributing
- Ceci est un projet étudiant, les pull requests ne provenant pas des éléves du centre de formation sont refusées pour le moment. 
- Merci d'ouvrir une issue en premier pour discuter les changement que vous voudriez apporter avant de pull request.

---
## 🧯Known issues (work in progress)

C'est un projet en cours de developement.
- Les resources sont crées sur azure, pour d'autre fournisseur cloud il faut modifier le code.
- La sécurisation des données via l'utilisation d'un keyvault reste à faire.
