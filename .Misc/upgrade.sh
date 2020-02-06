#! /usr/bin/env zsh
reset

line="__________________________________________________ \n\n"

if [[ $(lsb_release -is) = ManjaroLinux ]]
then
	printf "yay\n\n"
	yay -Syu --needed --nocleanmenu --nodiffmenu --removemake
else
	printf "apt\n\n"
	sudo apt update
	sudo apt upgrade
fi

printf $line

printf "zplugin modules\n\n"
zpl update
printf $line

printf "zplugin\n\n"
zpl self-update
printf $line
