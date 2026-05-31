#!/bin/bash
echo "Podaj username: "
read username
echo "Podaj haslo: "
read password

if [[ -z $(cat /etc/shadow | grep "$username") ]]
then
	echo "A user with this username does not exist."
	exit 1
fi
echo $(cat /etc/shadow | grep "$username" | grep -m 1 -o :[^:]*: | head -n 1)
echo $(mkpasswd -m yescrypt -S j9T "$password")
