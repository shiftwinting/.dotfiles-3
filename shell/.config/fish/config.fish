# Define environment variables
set -Ux EDITOR nvim
set -Ux VISUAL nvim 
set -Ux MANPAGER 'nvim +Man!'

set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_CACHE_HOME $HOME/.cache
set -Ux XDG_DATA_HOME $HOME/.local/share
set -Ux XDG_DATA_DIRS /usr/local/share:/usr/share
set -Ux XDG_CONFIG_DIRS /etc/xdg

# Change ls colors. Possible colors schemes: ayu, jellybeans, molokai, snazzy, solarized-dark, solarized-light.
set -Ux LS_COLORS (vivid generate snazzy)

# Change capslock to control
setxkbmap -option "ctrl:nocaps"

# Remove the start greeting
set -U fish_greeting

# Accept autosuggestion with control-space
bind -k nul forward-char

# Add bin folder to path
fish_add_path "$HOME/.dotfiles/bin/.bin"
