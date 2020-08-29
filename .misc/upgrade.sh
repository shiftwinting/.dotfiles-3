#! /usr/bin/env zsh
reset

line="__________________________________________________ \n\n"

if [[ $(lsb_release -is) = ManjaroLinux ]]; then
	printf "yay\n\n"
	yay -Syu --needed --nocleanmenu --nodiffmenu --removemake
else
	printf "apt\n\n"
	sudo apt update
	sudo apt upgrade
fi

printf $line

printf "zinit modules\n\n"
zinit update -p
printf $line

printf "zinit\n\n"
zinit self-update
printf $line
