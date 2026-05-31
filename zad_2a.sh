#!/bin/bash
echo "What's the username?: "
read username
ID=$(id -u "$username")
if [[ "$ID" -eq 0 ]]
then
    echo "Konto admina."
else
    echo "To nie jest konto admina."
fi

