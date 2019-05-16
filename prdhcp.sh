#!/usr/bin/bash

isRoot=$(whoami)
if [ $isRoot != 'root' ];then
  echo 'You Must Be root Or Use sudo to run '$0
  exit 1
fi

devList=$(ip r | grep default | awk '{print $5}')
for i in $(echo $devList | tr " " "\n")
do
  echo 'IP Address Of '$i'Device Is => '$(ip a s | grep $i | tail -1 | awk '{print $2}')
  echo -n 'Network Device => '$i' => '
  cat $(ls -lt /var/lib/NetworkManager/dhclient-*$i*.lease | head -n 1 | awk '{print $9}') | grep -i dhcp-server | head -n 1 | awk '{print $3}' | sed 's/;$//'
done
myExtIP=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{print $2}')
echo 'Public IP Is => '$myExtIP
