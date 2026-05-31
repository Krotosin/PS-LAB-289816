#!/bin/bash
number=$(( $RANDOM%246 ))
counter=0
while [[ $counter -lt 10 ]]
do
((number++))
((counter++))
echo "192.168.1.${number}"
done
