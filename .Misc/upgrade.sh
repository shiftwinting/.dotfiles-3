#! /usr/bin/env zsh
reset

line="__________________________________________________ \n\n"

printf "pacman\n\n"
yay
printf $line

printf "zplugin modules\n\n"
zpl update
printf $line

printf "zplugin\n\n"
zpl self-update
printf $line
