#!/usr/bin/bash

argsNum=("$#")

if [ $argsNum -lt 1 ];then
  echo 'Usage: netchk.sh HostName(s) File Name'
  exit 0
fi

if [ ! -f $1 ]; then
  echo 'Host File Does Not Exists Please Create It . . .'
  exit 0
fi

if [ ! -s $1 ]; then
  echo 'File Looks Empty Please Provide Some Data In It . . .'
  exit 1
fi  

i=0
j=1

while IFS= read -r hostLine; do
  hostsList[i]=$hostLine
  i=$(($i+1))
done < $1

reportFile='mtr-report-'$(date +'%d%m%Y%H%M%S')

while true; do
  echo '=============================================================+ Starting The Process +=========================================================================================================================' >> $reportFile
  for hostName in ${hostsList[@]}; do
    echo '=============================================================+ Start -> '$hostName' +=======================================================================================================================' >> $reportFile
    mtr -c 3 -r $hostName >> $reportFile
    echo '=============================================================+ End -> '$hostName' +=========================================================================================================================' >> $reportFile
  done
  echo '=============================================================+ End Of -> '$j' Loop +==========================================================================================================================' >> $reportFile
  j=$(($j+1))  
done
