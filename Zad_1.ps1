Write-Host "This script is one that uses the connection between a Kali Linux VM, configured to run an OpenSSH server,
and a Windows PC that the VM is based on."

Write-Host "Please specify the output file's name [output_file.txt]: "
$output_filename = Read-Host 
if("" -eq $output_filename){
    $output_filename = "output.txt"
}

Write-Host  "Please choose what command you would like to run on the OpenSSH server:"
Write-Host "[ls / ls -l / ls -a / ls -la / tree / tree -a]"
$input_command = Read-Host
switch ($input_command) {
    "ls" {
        Write-Host "Command [ls] acknowledged - proceeding..."
        ssh kali@10.200.1.152 "$input_command" > ./"$output_filename"
    }
    "ls -l" { 
        Write-Host "Command [ls -l] acknowledged - proceeding..." 
        ssh kali@10.200.1.152 "$input_command" > ./"$output_filename"
    }
    "ls -a" {
        Write-Host "Command [ls -a] acknowledged - proceeding..."
        ssh kali@10.200.1.152 "$input_command" > ./"$output_filename"
    }
    "tree" {
        Write-Host "Command [tree] acknowledged - proceeding..."
        ssh kali@10.200.1.152 "$input_command" > ./"$output_filename"
    }
    "tree -a" {
        Write-Host "Command [tree -a] acknowledged - proceeding..."
        ssh kali@10.200.1.152 "$input_command" > ./"$output_filename"
    }
    default {
        Write-Host "Command not recognized - do you wish to run command 'ls' [Y/n]:"
        $decision = Read-Host
        if ("" -eq $decision -or "Y" -eq $decision -or "y" -eq $decision -or "yes" -eq $decision -or "Yes" -eq $decision -or "YES" -eq $decision){
            Write-Host "Proceeding with command [ls]..."
            ssh kali@10.200.1.152 "ls" > ./"$output_filename"
        } elseif ("N" -eq $decision -or "n" -eq $decision -or "no" -eq $decision -or "No" -eq $decision -or "NO" -eq $decision){
            Write-Host "Exiting program..."
            exit 1
        }
    }
}