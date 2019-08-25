#! /usr/bin/env zsh
reset

line="__________________________________________________ \n\n"

printf "yay\n\n"
yay -Syu --needed --nocleanmenu --nodiffmenu --removemake
printf $line

printf "zplugin modules\n\n"
zpl update
printf $line

printf "zplugin\n\n"
zpl self-update
printf $line
