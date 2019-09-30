#!/usr/bin/bash

argsNum=("$#")

if [ $argsNum -lt 1 ];then
  echo 'Usage: netchk.sh HostName(s)'
  exit 0
fi

reportFile='mtr-report-'$(date +'%d%m%Y%H%M%S')

hostList=("$@")

while true; do
  for hostName in ${hostList[@]}; do
    echo '=============================================================+ Start -> '$hostName' +==================================================================================================================================' >> $reportFile
    mtr -c 3 -r $hostName >> $reportFile
    echo '=============================================================+ End -> '$hostName' +==================================================================================================================================' >> $reportFile
  done
done
