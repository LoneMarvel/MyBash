#!/usr/bin/bash

function ActivateEnv(){
	cd $1
	source ./venv/bin/activate
}

function CreateEnv(){
	cd $1
	virtualenv venv
}	

if [ "$#" -lt 1 ]; then
	dirLoc=$(pwd)
else
	dirLoc=$1
fi

if [ -d $dirLoc"/venv" ]; then
	echo "venv Exists Acivating Python 3 Virtual Enviroment . . ."
	ActivateEnv $dirLoc
else
	echo "venv Does Not Exists"
	echo -n "Do You Want To Create Python 3 Virtual Enviroment In "$dirLoc" (y/n): "
	read confRes
fi

if [ $confRes == 'y' ]; then
	echo "Creating Python 3 Virtual Enviroment . . ."
	mkdir $dirLoc
	CreateEnv $dirLoc
	ActivateEnv $dirLoc
fi	
