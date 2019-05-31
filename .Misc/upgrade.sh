#! /usr/bin/env zsh
reset

line="__________________________________________________ \n\n"

printf "pacman\n\n"
upgrade
printf $line

printf "Prezto\n\n"
zprezto-update
printf $line

printf "zplugin\n\n"
zpl update
zpl self-update
printf $line
