export EDITOR=nvim			# Set neovim as default editor.
export VISUAL=nvim			# Set neovim as default reader.


# Distro-specific alias and functions.
if [[ $(lsb_release -is) = ManjaroLinux ]]
then
	alias ls="~/.dotfiles/.Misc/ls --color=auto --group-directories-first -X"

	alias install="yay -S --needed --nocleanmenu --nodiffmenu --removemake"
	alias pinstall="sudo powerpill -S"
	alias show="yay -Si"
	alias search="yay -Ss"
	alias fsearch="yay -F"
	alias list="reset; yay -Qe"
	alias remove="yay -Rs"
	alias mirror="sudo pacman-mirrors --geoip && sudo pacman -Syyu"
	alias orphan='yay -Qdtq | yay -Rs -'

	#Enable/Disable touchpad
	device="Synaptics TM2985-009"

	enabled=$(xinput --list-props "$device" | grep "Device Enabled" | awk '{print $NF}')

	if [[ "$enabled" == "1" ]]; then
		alias toggle="xinput --disable '$device' && reload"
	else
		alias toggle="xinput --enable '$device' && reload"
	fi
else
	# Ubuntu
	alias ls="ls --color"
	alias install="sudo apt install"

	# WSL - i.e. running Ubuntu through Windows.
	if [[ $(uname -r) =~ Microsoft$ ]]; then
		alias cd2="cd /mnt/c/Users/gocdu/"
		alias cd3="cd /mnt/c/Users/gocdu/Desktop/cmt"
	fi
fi


# git
alias gac="git add .; git commit"
alias gap="git add -p"
alias gb="git branch"
function gbD(){git push origin --delete $1}
alias gc="git commit"
alias gcd="cd-gitroot"
alias gdc="forgit::diff --cached"
alias gcl="git clone --recursive"
alias gcl1="git clone --depth=1"
alias gclc="git clean -ffxd :/"
alias gclc1="git clean -f"
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
alias vi="$EDITOR"
alias svi="sudo $EDITOR"

#ls
alias la="ls -A"
alias ll="la -l"

alias up="source ~/.dotfiles/.Misc/upgrade.sh"

# VSCode
alias code="code ."

# goto
alias d="cd ~/.dotfiles"
alias c="cd ~/.dotfiles/config/.config"
alias zs="cd ~/.zplugin/snippets"
alias zp="cd ~/.zplugin/plugins"
alias zb="cd ~/.zplugin/bin"
alias m="cd /usr/share/texmf-dist/tex/latex/moderncv"
alias ft="cd ~/.config/nvim/ftplugin"

#config
alias ali="$EDITOR ~/.zshenv"
alias rc="$EDITOR ~/.zshrc"
alias nvimrc="$EDITOR ~/.config/nvim/init.vim"
alias bsprc="$EDITOR ~/.config/bspwm/bspwmrc"
alias sxhrc="$EDITOR ~/.config/sxhkd/sxhkdrc"
alias trc="$EDITOR ~/.tmux.conf"
alias un="$EDITOR ~/.dotfiles/home/.uncrustify.cfg"

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
alias restore="pushd -q && cd -q ~/.dotfiles && git checkout . && popd -q && reload"

# date of 90 days prior
alias 90='date +%d:%m:%Y -d "90 day ago"'

# Download youtube as mp3
alias yget="youtube-dl --extract-audio --audio-format mp3"

# Print random file in current folder
alias random_file="ls | shuf -n 1"

# Don't record in history.
alias vlc=" vlc"

# Screenshot
function ss(){gnome-screenshot NUL -d ${1:-10} &}

# Brightness
alias x="xbacklight"
alias x+="xbacklight -inc 10"
alias x-="xbacklight -dec 1"
alias xmax="xbacklight -inc 100"
alias xmin="xbacklight -inc 100 && xbacklight -dec 99"
alias xg="xbacklight -get"

# MkDocs
alias serve="cd ~/zplugin_readme && mkdocs serve NUL &"
alias build="cd ~/zplugin_readme && mkdocs build -d wiki"

# Use make without printing the input and automatically use parallel jobs.
alias make="make -j -s"

#Make ag not print Permission denied
alias ag="ag --silent"

# Make commands human-readable.
alias du="du -h"
alias df="df -h"
alias free="free -h"

# Fast tmux
alias t="tmux"

# Print PATH and fpath
alias path="tr ':' '\n' <<< "$PATH""
alias fpath="tr ':' '\n' <<< "$FPATH""

# Fast zathura
function z(){zathura $1 &}

# Allows leaving from deleted directories
alias ..='command .. 2>/dev/null || cd $(dirname $PWD)'

# allow sudo to expand aliases as well as run anything in $PATH
alias sudo='sudo env PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"  '

# Automatically run ls after using cd.
function chpwd(){la}

# Make npm automatically global.
alias npm="sudo npm -g"

