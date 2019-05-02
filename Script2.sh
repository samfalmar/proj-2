#!/bin/bash

clear
#Make sure the script is being executed with superuser privileges
	if ! [ $(id -u) = 0 ];
	then
		echo "No sou root"
		echo "Executeu-lo amb privilegis"
	exit 1
	fi

#Get the username
	echo "Quin nom d'usuari vols?:"
	read  USER_NAME
	if [ ! -z "$USERNAME" ]
	then
			echo "Introdueix el teu nom d'usuari correctament"
			exit 1
	fi

#Get the real name
	echo "Quin es el teu nom real?:"
	read  NOM_REAL
	if [ ! -z "$NOM_REAL" ]
	then
			echo "Introdueix el teu nom correctament"
			exit 1
	fi
#Get a random password
	CONTRASENYA=
	
#Create the user
	useradd -m -c $NOM_REAL $USER_NAME

#Check if the useradd command succeeded
	if [ $? -ne 0 ]
	 then
  	 echo "No s'ha creat correctament el usuari."
	exit 1
	fi

#Set the password
	echo $USER_NAME:$CONTRASENYA | chpasswd

#Check if the passwd command succeeded
	if [ $? -ne 0 ]
	 then
  	 echo 'La contrasenya no s.ha establert correctament.'
  	exit 1
	fi


#Force password change on first login
passwd -e $USER_NAME
HOSTNAME=`hostname`
sleep 2
clear


#Display the username, password, and the host where the user was created.
	echo '-----------------------------------------'
	echo 'Les dades introduïdes son les seguents:'
	echo '-----------------------------------------'
	echo ''
	echo 'El teu user name es: ' $USER_NAME
	echo 'La teva passwd es: '$CONTRASENYA
	echo 'I el host es:' $HOSTNAME
	echo ''
	echo '-----------------------------------------'


skere
