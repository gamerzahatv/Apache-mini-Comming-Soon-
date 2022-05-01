#!/bin/bash
allpackages=(
    #"apache2"
    #"php"
    "nano"
)
function setup(){
	try || catch 
}

function try(){
	read -p "Enter your name [Y]: " name
	name=${name:-y}
	if [[ $name =~ ^[Yy]$ ]]; then
		for task in "${allpackages[@]}";
			do
				sudo apt-get install $task
			done
	fi
}
function catch(){
	for task in "${allpackages[@]}";
			do
				apt-get install $task
			done
}
#call run
setup
