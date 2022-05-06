#!/bin/bash
# Author: meepmaster
# Date: 06-05-2022
# Description: Nmap scan


# Color variables 

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

# Banner

function banner() {
	clear
	echo -e "${GREEN}"
	echo -e " __  __  ____  ____  ____  ___   ___    __    _  _  ____  ____  "
	echo -e "(  \/  )( ___)( ___)(  _ \/ __) / __)  /__\  ( \( )( ___)(  _ \ "
	echo -e " )    (  )__)  )__)  )___/\__ \( (__  /(__)\  )  (  )__)  )   / "
	echo -e "(_/\/\_)(____)(____)(__)  (___/ \___)(__)(__)(_)\_)(____)(_)\_) "                                                                       
	echo -e "${NOCOLORS}v1.6.1" 
}

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

function help() {
less << _EOF_

 Meepscan -- Nmap Scanner (Version 1.6.1)  -help

 Meepscan is a tool that automates nmap scanning of defined ip, based in
 Linux systems.

 Press "q" to exit this Help page.

 Commands:
 
 	Choose directory
	git clone git@github.com:meepmaster360/meepscan.git
	cd meepscan
	$sudo bash meepscan.sh 
	or 
	$chmod +x meepscan.sh (once) 
	$sudo ./meepscan.

 By Meepmaster360

 Disclaimer:

 THIS SOFTWARE IS PROVIDED BY MEEPMASTER360 “AS IS” AND ANY EXPRESS OR IMPLIED
 WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL MEEPMASTER360 BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
 IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.

_EOF_
}



# Nmap open ports

function nmap_ports_open_intense () {
	echo -e "\n${GREEN}Type IP${NOCOLOR} ex: 192.168.1.1\n"
	read ip
	echo -e "\n${GREEN}Grabbing open ports...${NOCOLOR}"
	ports=$(nmap -p- --min-rate 1000 -T4 $ip | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)  
	echo -e "\n${GREEN}Ports grabbed!${NOCOLOR}"
	echo -e "\n${GREEN}Scanning open ports...${NOCOLOR}\n"
	sudo nmap -T4 -sC -sV -A -Pn -p $ports $ip
	echo				
}

# Nmap open ports

function nmap_ports_open_fast () {
	echo -e "\n${GREEN}Type IP${NOCOLOR} ex: 192.168.1.1\n"
	read ip
	echo -e "\n${GREEN}Grabbing open ports...${NOCOLOR}"
	ports=$(nmap -p- --min-rate 1000 -T4 $ip | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)  
	echo -e "\n${GREEN}Ports grabbed!${NOCOLOR}"
	echo -e "\n${GREEN}Scanning open ports...${NOCOLOR}\n"
	sudo nmap -T4 -p $ports $ip
	echo				
}

function menu(){
    echo -e ""
    echo -e "${GREEN}[?]${NOCOLOR} Scan type"
    echo -e ""
    echo -e "${GREEN}1${NOCOLOR} Fast Scan"
    echo -e "${GREEN}2${NOCOLOR} Intense Scan"
    echo -e ""
    echo -e "${GREEN}3${NOCOLOR} Check/Install Dependencies"
    echo -e "${GREEN}4${NOCOLOR} Help"
    echo -e ""
    echo -e "${GREEN} Select one : ${NOCOLOR}"
	read meno;
    echo -e ""
    
    if [ $meno = 1 ]
    then
        nmap_ports_open_fast
    elif [ $meno = 2 ]
    then
        nmap_ports_open_intense
    elif [ $meno = 3 ]
    then
        app_install
    elif [ $meno = 4 ]
    then
        help		
    else
        echo -e "${GREEN} Wrong option, Bye...${NOCOLOR}";sleep 2
		exit
    fi
}

# Call functions

banner
user
connect
menu
