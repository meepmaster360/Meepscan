#!/bin/bash
# Author: meepmaster
# Date: 06-05-2022
# Description: Nmap scan

echo -e "
#                                                        
#    /\/\   ___  ___ _ __  ___  ___ __ _ _ __   ___ _ __ 
#   /    \ / _ \/ _ \ '_ \/ __|/ __/ _` | '_ \ / _ \ '__|
#  / /\/\ \  __/  __/ |_) \__ \ (_| (_| | | | |  __/ |   
#  \/    \/\___|\___| .__/|___/\___\__,_|_| |_|\___|_|   
#                   |_|                                  "

# Color variables 

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

# User root check

function user() {
	if [ $(id -u) != "0" ];then																				
		echo -e "\n${GREEN}Please run this script with root user!${NOCOLOR}"
		exit 1
	fi
}

# Internet connection check

function connect() {
	ping -c 1 -w 3 google.com > /dev/null 2>&1																
	if [ "$?" != 0 ];then
		echo -e "\n${RED}[!]${NOCOLOR} ${GREEN}This script needs an active internet connection!${NOCOLOR}"
		exit 1
	fi
}

function app_install () {

# Nmap installation	

	if [ ! -x "$(command -v nmap)" ];then																	
        echo -e "${RED}[+]${NOCOLOR} ${GREEN}Nmap not detected...Installing${NOCOLOR}"
        sudo apt-get install nmap -y > installing;rm installing
		else
    	echo -e "\n${GREEN}[+]${NOCOLOR}Nmap detected"
     
	fi
}

# Nmap open ports

function nmap_ports_open () {
	echo -e "\n${GREEN}Type IP${NOCOLOR} ex:192.168.1.1\n"
	read ip
	echo -e "\n${GREEN}Grabbing open ports...${NOCOLOR}"
	ports=$(nmap -p- --min-rate 1000 -T4 $ip | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)  
	echo -e "\n${GREEN}Ports grabbed!${NOCOLOR}"
	echo -e "\n${GREEN}Scanning open ports...${NOCOLOR}"
	sudo nmap -T4 -sC -sV -A -Pn -p $ports $ip
	echo				
}	

# Call functions

user
connect
app_install
nmap_ports_open
