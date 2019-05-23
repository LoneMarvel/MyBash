#!/usr/bin/bash

if [ "$#" -lt 1 ]; then
  echo 'Usage: dirsz <Directory Path>'
  exit 0
fi

targetDir=$1'/*/'

for i in $(ls -d ${targetDir})
do
  echo -n 'Directory Name => '$i' => '
  du -hc $i | grep total | rev | cut -c6- | rev
done
