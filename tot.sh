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
	dirOpen=$1
fi

ls -psSl | grep -v '\$' | awk 'BEGIN {$6}{sum+=$6} END {print "Total Files Size -> "sum}'
