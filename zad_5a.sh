#!/bin/bash
device_name=$HOSTNAME
current_date() {
	echo "Aktualna data na ${device_name} to: "
	date -d today
}
linux_vers() {
	echo "Obecna wersja Linuxa na ${device_name} to: "
	cat /etc/os-release | grep -i "version=" | grep -o [0-9.]*
}
user() {
	echo "Obecna nazwa uzytkownika to: "
	echo "$USER"
}
IP_address() {
	echo "Obecny adres IP na ${device_name}, to: "
	hostname -I | grep -o [0-9.]* | head -n 1
}


current_date
echo " "
linux_vers
echo " "
user
echo " "
IP_address
