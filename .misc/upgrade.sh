#! /usr/bin/env zsh
reset

line="__________________________________________________ \n\n"

printf "yay\n\n"
yay -Syu --needed --nocleanmenu --nodiffmenu --removemake

printf $line

printf "zinit modules\n\n"
zinit update -p
printf $line

printf "zinit\n\n"
zinit self-update
printf $line
