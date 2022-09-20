#!/bin/bash
#creation fichier instruction sql 
sudo touch instructionsql.sql


#connexion mariadb-client avec password et injection de nos instruction liée a wordpress
#sudo mariadb --user=$ADMIN --password=$ADMINPASS --host=$B12MARIADB < instructionsql.sql > output.tab


# injection requete creation db et user 
sudo echo "CREATE DATABASE IF NOT EXISTS $database_wp_name_here default character set utf8 collate utf8_unicode_ci;" >> instructionsql.sql
sudo echo "CREATE USER IF NOT EXISTS '$username_wp'@'$database_wp_name_here' IDENTIFIED BY '$password_wp';" >> instructionsql.sql
sudo echo "GRANT ALL on $database_wp_name_here.* to '$username_wp'@'$database_wp_name_here' identified by '$password_wp';" >> instructionsql.sql
# flush privileges;
# exit;



nomdb=Brief12-groupe
echo "Nombre de db"
read nbdb


Create_db (){
	echo $componomdb

}

Nombre_db (){
	f=1
	while [ $f -le $nbdb ]
	do	
		componomdb=$nomdb$f"DEV"
		Create_db
		componomdb=$nomdb$f"PROD"
		Create_db
		f=$((f+1))
	done
}

MAIN(){
	Create_db
	Nombre_db
}

MAIN

#connexion à mariadb et injection du fichier instruction sql
sudo mariadb --user=ADMIN --password=ADMINPASS --host=brief12mariadb.mariadb.database.azure.com < instructionsql.sql > output.tab