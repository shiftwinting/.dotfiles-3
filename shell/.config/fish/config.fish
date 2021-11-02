set -Ux EDITOR nvim
set -Ux VISUAL nvim 

set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_CACHE_HOME $HOME/.cache
set -Ux XDG_DATA_HOME $HOME/.local/share
set -Ux XDG_DATA_DIRS /usr/local/share:/usr/share
set -Ux XDG_CONFIG_DIRS /etc/xdg

# Change ls colors. Possible colors schemes: ayu, jellybeans, molokai, snazzy, solarized-dark, solarized-light.
set -Ux LS_COLORS (vivid generate snazzy)

setxkbmap -option "ctrl:nocaps"
