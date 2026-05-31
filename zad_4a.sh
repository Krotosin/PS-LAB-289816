#!/bin/bash
number=$(( $RANDOM%246 ))
for counter in {1..10}
do
((number++))
echo "192.168.1.${number}"
done
