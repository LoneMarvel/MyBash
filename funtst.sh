#!/usr/bin/bash

echo "This Is A Test For Functions Calling . . ."

function EchoMsgFst() {
	echo "Just Called From EchoMsgFst Function"
       	return
}

function EchoVarFun() {
	echo "Just Called A Function With Variable"
	echo "varTst Is -> "$1
}

function EchoNumVar(){
	echo "Function Called For Numeric Variables"
	echo "The Sum Is -> "$[$1+$2]
}

function FunQuit(){
	echo -n "Do You Want To Quit (y/n): "
	read res
	if [ $res == 'y' ];then
		exit
	fi
	return
}

EchoMsgFst
varTst='TestVar'
EchoVarFun TestVar
EchoNumVar 1 3
FunQuit
