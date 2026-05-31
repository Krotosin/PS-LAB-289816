#!/bin/bash
echo "Podaj nazwe pliku: "
read filename
if [[ -e "$filename" ]] 
then 
	echo "File '$filename' exists."
else
	echo "File '$filename' does not exist."
fi
if [[ -e "$filename" ]]
then
	if [[ -s "$filename" ]]
	then 
		if [[ -z "$(ls $filename)" ]]
		then 
			echo "File '$filename' is empty."
		else
			echo "File '$filename' is not empty."
		fi
	else
		echo "File '$filename' is empty."
	fi
fi
if [[ -e "$filename" ]] 
then
	if [[ -d "$filename" ]]
	then
		echo "File '$filename' is a directory."
	else 
		echo "File '$filename' is not a directory."
	fi
fi
