#!/bin/bash

echo "Specify path to the plaintext file:"
read plaintext_path

if [[ $null == $plaintext_path ]] then
	echo "Path to plaintext is invalid."
	exit 1
fi

echo "Input filepath is valid. Please input your encryption password:"
read encryption_password

if [[ $null != $encryption_password ]] then
	echo "[Password accepted. Proceeding]"
else
	echo "No password has been input."
	echo "Encryption cannot commence."
	exit 1
fi


openssl enc -aes-256-cbc -salt -pbkdf2 -iter 100000 \
    -in "$plaintext_path" \
    -out "ciphertext.txt" \
    -pass "pass:$encryption_password"

echo "[ENCRYPTION COMPLETE]"
