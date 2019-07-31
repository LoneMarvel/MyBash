#!/usr/bin/bash

if [ "$#" -lt 1 ]; then
	dirOpen=$(pwd)
else
	dirOpen=$1
fi

ls -hsSp $dirOpen| grep -v '/$' | awk '{print $1" - "$2}BEGIN {$1}{sum+=$1} END {print "Total Files Size -> "sum}'
