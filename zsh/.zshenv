# Remove first dollar in commands
alias \$=''

# vim
alias vi="nvim"
alias svi="sudo nvim"

# ls
alias ls="~/.dotfiles/.Misc/ls --color=auto --group-directories-first -X"
alias la="ls -A"
alias ll="la -l"

# pacman/yay
alias install="yay -S --needed --nocleanmenu --nodiffmenu --removemake"
alias show="yay -Si"
alias search="yay -Ss"
alias fsearch="yay -Fs"
alias list="reset; yay -Qe"
alias remove="yay -Rs"
alias up="source ~/.dotfiles/.Misc/upgrade.sh"
alias mirror="sudo pacman-mirrors --geoip && sudo pacman -Syyu"
alias orphan="yay -Rs $(yay -Qqtd)"

# VSCode
alias code="code ."

# goto
alias d="cd ~/.dotfiles"
alias c="cd ~/.dotfiles/config/.config"
alias z="cd ~/.zplugin"
alias zs="cd ~/.zplugin/snippets"
alias zp="cd ~/.zplugin/plugins"
alias zb="cd ~/.zplugin/bin"
alias ki="cd ~/.config/kitty"
alias kit="cd ~/.config/kitty/themes"

#config
alias ali="vi ~/.zshenv"
alias rc="vi ~/.zshrc"
alias vimrc="vi ~/.vimrc"
alias nvimrc="vi ~/.config/nvim/init.vim"
alias bsp="vi ~/.config/bspwm/bspwmrc"
alias sxh="vi ~/.config/sxhkd/sxhkdrc"

# reload
alias reload="exec zsh"

# reset
alias reset="tput reset"

# git 
alias gac="git add .; git commit"
alias gap="git add -p"
alias gb="git branch"
alias gc="git commit"
alias gdc="forgit::diff --cached"
alias gcl="git clone"
alias gcl1="git clone --depth=1"
alias gco="git checkout"
alias gf="git add .; git commit -m 'Quick update, squash later.'"
alias gt="git add .; git commit -m 'Test commit, will likely delete after.'"
alias gl="forgit::log"
alias gp="git push"
alias gpl="git pull"
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'
alias gra="git rebase --abort "
function gri(){git rebase -i HEAD~${1:-10}}
alias gs="git status"
alias go="git open"

# wifi
alias wifi="sudo nmtui"

# gantenbein
alias ssha="source ~/.runSSH"

# Global alias
alias -g A="| ack"
alias -g C="| xclip -selection clipboard"
alias -g NE="2> /dev/null"
alias -g NUL="&> /dev/null"

# python
alias py="python3"

# Safe/verbose ops
alias rm="rm -iv" 
alias mv="mv -iv" 
alias mkdir="mkdir -pv" 

# xclip
alias clip="xclip -sel clip <"

# web
function fire() {firefox $1 NUL}
function chrome() {chromium $1 NUL}

# rmdir
alias rmd="rmdir *"

# Restore dotfiles
alias restore="d && gco ."

# date of 90 days prior
alias 90='date +%d:%m:%Y -d "90 day ago"'

# Download youtube as mp3
alias yget="youtube-dl --extract-audio --audio-format mp3" 

# pip
alias pip="sudo pip"

# Print random file in current folder
alias random_file="ls | shuf -n 1"

# Don't record in history.
alias vlc=" vlc"
alias cd=" cd"

# Run npm packages locally
alias antora="$(npm bin)/antora "
alias mmdc="$(npm bin)/mmdc -p puppeteer-config.json -i flowchart.mmd -o output.png"

# Screenshot
alias ss="gnome-screenshot NUL"

# Brightness
alias bright="xrandr --output eDP1 --brightness"

# MkDocs
alias serve="cd ~/zplugin_readme && mkdocs serve NUL &"
alias build="cd ~/zplugin_readme && mkdocs build -d wiki"
#####################
# Functions

# Automatically run ls after using cd.
function chpwd(){la}
