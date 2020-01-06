#####################################################################################
#
# Author: Tinos
# Script Description: Calculate the total size of the files only in a directory
# AuthorEmail: tinost@gmail.com
#
#####################################################################################

#!/usr/bin/bash

if [ "$#" -lt 1 ]; then
	dirOpen=$(pwd)
else
	if [ ! -d $1 ]; then
		echo 'It Is Not A Directory'
		exit 1
	else
		dirOpen=$1
	fi
fi


ls -psSl $dirOpen | grep -v '\$' | awk 'BEGIN {$6}{sum+=$6} END {print "Total Files Size -> "sum}'
