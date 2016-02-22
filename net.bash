#!/bin/bash
PS3='Escolha sua Opcao: '
options=("Habilitar" "Desabilitar" "Reiniciar")
select opt in "${options[@]}"
do
    case $opt in
        "Habilitar")
            opcao="iptables -F FORWARD\r"
	    break
            ;;
        "Desabilitar")
            opcao="iptables -F FORWARD;\r"
            opcao1="iptables -F INPUT;\r"
            opcao2="iptables -A FORWARD -s 192.168.1.150 -j ACCEPT;\r"
            opcao3="iptables -A FORWARD -d 192.168.1.150 -j ACCEPT;\r"
            opcao4="iptables -A FORWARD -j DROP;\r"
            break   
 	;;
 	"Reiniciar")
            opcao="reboot\r"
            break   
 	;;
        *) echo "Opcao invalida";;
    esac
done
expect << EOF
set timeout 5
spawn telnet 192.168.1.1
expect "login: "
send "admin\r"
expect "Password: "
send "gvt54321\r"
expect "*#"
send "$opcao\r"
expect "*#"
send "$opcao2\r"
expect "*#"
send "$opcao3\r"
expect "*#"
send "$opcao4\r"
expect "*#"
send "exit"
exit
EOF
exit
