## notes de groupe Mariadb

### sur terraform:
- commande de creation de ressource Mariadb 
- commandes de creation des tables dans Mariadb 
- commandes de creation des users et pass  (soit en sql/bash) voir si possible terraform
- script boucle generation de nom et pass

### securité pass
- azure keyvault pour sauvegarder pass
    - secret
    - https://www.ntweekly.com/2021/02/02/add-a-secret-to-azure-key-vault-with-terraform/
- service principal
    - voir si on peut se connecter avec ca à mariadb
    - creer une branche dans Active directory pour mariadb et tester
    - attention à ne pas casser le systeme poru tout le monde

---

- ressource groupe test : Brief12_Mariadb_test
- branch mariadb sur github
- structure globale du code
- puissance necessaire pour db (certainement au moin la 1ere offre prod)

---
sur github
- Matomi boss

---
### repartition des taches :
- creation des tables en script terraform (bash ou az si pas mieu) :
    - Matomi, Alain
- boucle terraform ou bash pour generation des pass et users : 
    - Driton, Jeremy