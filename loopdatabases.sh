#!/bin/bash
#creation fichier instruction sql 
sudo touch instructionsql.sql


#connexion mariadb-client avec password et injection de nos instruction liée a wordpress
#sudo mariadb --user=$ADMIN --password=$ADMINPASS --host=$B12MARIADB < instructionsql.sql > output.tab







nomdb=Brief12-groupe
echo "Nombre de db"
read nbdb


Create_db (){
	echo $componomdb

    # injection requete creation db et user 
sudo echo "CREATE DATABASE IF NOT EXISTS $componomdb default character set utf8 collate utf8_unicode_ci;" >> instructionsql.sql
sudo echo "CREATE USER IF NOT EXISTS '$componomuser'@'$componomdb' IDENTIFIED BY '$componomuserpass';" >> instructionsql.sql
sudo echo "GRANT ALL on $componomdb.* to '$componomuser'@'$componomdb' identified by '$componomuserpass';" >> instructionsql.sql

}

Nombre_db (){
	f=1
	while [ $f -le $nbdb ]
	do	
		componomdb=$nomdb$f"DEV"
		componomuser=$componomdb
		componomuserpass=$componomuser"pass"
		Create_db
		componomdb=$nomdb$f"PROD"
		componomuser=$componomdb
		componomuserpass=$componomuser"pass"
		Create_db
		f=$((f+1))
	done
}

Sqlfin(){
#finalisation du fichier d'instruction sql
echo "flush privileges;" >> instructionsql.sql
echo "exit;" >> instructionsql.sql
#connexion à mariadb et injection du fichier instruction sql
mariadb --user=ADMIN --password=ADMINPASS --host=brief12mariadb.mariadb.database.azure.com < instructionsql.sql > output.tab
}

MAIN(){
	Nombre_db
    Sqlfin

}

MAIN
