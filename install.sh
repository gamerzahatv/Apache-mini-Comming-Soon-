#!/bin/bash
allpackages=(
    "apache2"
    "php"
    "nano"
)
function setup(){
	trysetup || catchsetup
}
function aptupdate(){
	read -p "Do you want apt update && sudo apt upgrade [Y/N]: " result
	result=${result:-N}
	if [[ $result =~ ^[Yy]$ ]]; then
		apt update && sudo apt upgrade
	else
		setup
	echo $result
	fi
}

# try catch setup
function trysetup(){
	echo "ALL PACKAGES YOU WILL INSTALL"
	for display in "${allpackages[@]}";
		do
			echo $display
		done
	read -p "Do you want  insall package [Y/N]: " name
	name=${name:-y}
	if [[ $name =~ ^[Yy]$ ]]; then
		for task in "${allpackages[@]}";
			do
				apt-get install $task
			done
	else
		exit 0
	fi
}
function catchsetup(){
	for task in "${allpackages[@]}";
			do
				sudo apt-get install $task
			done
}
#call run
aptupdate
