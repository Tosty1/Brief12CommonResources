#!/bin/bash
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