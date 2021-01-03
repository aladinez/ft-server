#!/bin/bash

var=$(cat /etc/nginx/sites-available/default | grep "autoindex" | sed 's/\t//g')
on="autoindex on;"
off="autoindex off;"
green=`tput setaf 2`
red=`tput setaf 1`
reset=`tput sgr0`
if [[ "$var" == "$on" ]]
then
	echo "${red}turning off the autoindex...${reset}"
else
	echo "${green}turning on the autoindex...${reset}"
fi

mv /etc/nginx/sites-available/default /default2
mv /default1 /etc/nginx/sites-available/default
mv /default2 /default1
service nginx restart
