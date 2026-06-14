Write-Host "This script is one that uses the connection between a Kali Linux VM, configured to run an OpenSSH server,
and a Windows PC that the VM is based on."

"Below is a list of logs from the OpenSSH server, filtered to leave out logs of succesful opening and closing of valid sessions." > .\logs.txt
"" >> .\logs.txt
ssh kali@10.200.1.152 "journalctl -u ssh.service | grep -vi 'Accepted' |grep -iv 'user kali' | grep -iv 'starting'" >> .\logs.txt 