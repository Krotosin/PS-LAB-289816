#!/bin/bash
echo "Podaj liczbe: "
read number
if [[ $number -gt 0 ]] && [[ $(($number%2)) != 0 ]]
then
	echo "Podana liczba jest dodatnia i jest nieparzysta."
else
	echo "Podana liczba nie spelnia jednego lub obu warunkow."
fi
