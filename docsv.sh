#!/bin/bash

if [ "$*" == "" ] 
then
	echo "Usage: docsv Column Numbers"
	exit
fi
IFS=',' read -r -a array <<< $@
for i in ${array[@]}
do
	aVar=$aVar'";"$'$i
done
aVar=${aVar:1}
echo "Now aVar is --> "$aVar
j="cat awk-tst.txt | awk '{print $aVar}'"
echo $j
