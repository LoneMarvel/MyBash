#!/usr/bin/bash

isRoot=$(whoami)
declare -a devList
if [ $isRoot != 'root' ];then
  echo 'You Must Be root Or Use sudo to run '$0
  exit 1
fi

devList=$(ip r | grep default | awk '{print $5}')
for i in $(echo $devList | tr " " "\n")
do
  echo -n 'Network Device => '$i' => '
  cat $(ls -lt /var/lib/NetworkManager/dhclient-*$i*.lease | head -n 1 | awk '{print $9}') | grep -i dhcp-server | head -n 1 | awk '{print $3}' | sed 's/;$//'
done
