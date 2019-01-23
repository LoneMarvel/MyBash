#!/bin/bash

args=("$#")
if [ $args  -lt 1 ]; then
        echo "Usage: tt <Start Number> <Quantity Number>"
        exit 1
fi
start=$1
end=$(($start+$2))
while [ $start -lt $end ]
do
        for i in {0..2}
        do
                echo $start
        done
        start=$(($start+1))
done
