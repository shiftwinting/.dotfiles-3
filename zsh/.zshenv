# git 
alias gac="git add .; git commit"
alias gap="git add -p"
alias gb="git branch"
function gbD(){git push origin --delete $1}
alias gc="git commit"
alias gdc="forgit::diff --cached"
alias gcl="git clone --recursive"
alias gcl1="git clone --depth=1"
alias gclc="git clean -ffxd :/"
alias gco="git checkout"
alias gf="git add .; git commit -m 'Quick update, squash later.'"
alias gt="git add .; git commit -m 'Test commit, will likely delete after.'"
alias gl="forgit::log"
alias glr="forgit::log HEAD..origin"
alias gp="git push"
alias gpl="git pull"
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'
alias gra="git rebase --abort "
alias gres="git reset ."
function gri(){git rebase -i HEAD~${1:-10}}
alias gs="git status"
alias gopen="git open"
alias gu="git remote update"
alias gl1="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

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
alias pinstall="sudo powerpill -S"
alias show="yay -Si"
alias search="yay -Ss"
alias fsearch="yay -Fs"
alias list="reset; yay -Qe"
alias remove="yay -Rs"
alias up="source ~/.dotfiles/.Misc/upgrade.sh"
alias mirror="sudo pacman-mirrors --geoip && sudo pacman -Syyu"
alias orphan='yay -Rs $(yay -Qqtd)'

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
alias bsprc="vi ~/.config/bspwm/bspwmrc"
alias sxhrc="vi ~/.config/sxhkd/sxhkdrc"
alias tmuxrc="vi ~/.tmux.conf"

# reload
alias reload="exec zsh -o NO_GLOBAL_RCS"

# reset
alias reset="tput reset"

# Subversion
alias svc="svn checkout"

# wifi
alias wifi="sudo nmtui"

# Global alias
alias -g A="| ack"
alias -g C="| xclip -selection clipboard"
alias -g L="| less"
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
alias rmd="rmdir --ignore-fail-on-non-empty *"

# Restore dotfiles
alias restore="pushd && cd ~/.dotfiles && git checkout . && popd && reload"

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

# Screenshot
function ss(){gnome-screenshot NUL -d ${1:-10} &}

# Brightness
alias bright="xrandr --output eDP1 --brightness"

# MkDocs
alias serve="cd ~/zplugin_readme && mkdocs serve NUL &"
alias build="cd ~/zplugin_readme && mkdocs build -d wiki"

# Automatic logging into Gantenbein.
alias gant="sshpass -f "~/.gantenbein" ssh dundar@gantenbein.math.chalmers.se"

# Use make without printing the input.
alias make="make -s"

# Google Calendar in termianl
alias gcal="gcalcli"
alias gcalw="gcalcli calw"
alias gcalm="gcalcli calm"

#Make ag not print Permission denied
alias ag="ag --silent"

# Make du automatically human-readable
alias du="du -h"
#####################
# Functions

# Automatically run ls after using cd.
function chpwd(){la}
