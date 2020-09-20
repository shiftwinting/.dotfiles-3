#!/bin/bash

# Distro-specific
if [[ $(lsb_release -is) == ManjaroLinux ]]; then
	alias ls="$HOME/.dotfiles/.misc/ls --color=auto --group-directories-first -X"

	install() {
		if pacman -Sqi $1 &>/dev/null; then
			sudo powerpill -S $1
		else
			yay -S --needed --nocleanmenu --nodiffmenu --removemake $1
		fi
	}

	alias show="yay -Si"
	alias search="yay -Ss"
	alias fsearch="yay -F"
	alias list="reset; yay -Qe"
	alias remove="yay -Rs"
	alias mirror="sudo pacman-mirrors --geoip && sudo pacman -Syyu"
	alias orphan='yay -Qdtq | yay -Rs -'
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
gbD() { git push origin --delete "$1"; }
alias gc="git commit"
alias gcd="cd-gitroot"
alias gdc="forgit::diff"
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
gri() { git rebase -i HEAD~"${1:-10}"; }
alias gs="git status"
alias gopen="git open"
alias gu="git remote update"
alias gl1="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

# vim
alias vi='$EDITOR'
alias svi='sudo $EDITOR'

#ls
alias la="ls -A"
alias ll="la -l"

# Upgrade
alias up="source $HOME/.dotfiles/.misc/upgrade.sh"

# goto
alias d="cd $HOME/.dotfiles"
alias c="cd $HOME/.dotfiles/config/.config"
alias zs="cd $HOME/.zplugin/snippets"
alias zp="cd $HOME/.zplugin/plugins"
alias zb="cd $HOME/.zplugin/bin"
alias ds="cd $HOME/.dotfiles/shells"
alias ft="cd $HOME/.config/nvim/ftplugin"

#config
alias ali='$EDITOR $HOME/.aliases.sh'
alias rc='$EDITOR $HOME/.zshrc'
alias brc='$EDITOR $HOME/.bashrc'
alias zenv='$EDITOR $HOME/.zshenv'
alias zi='$EDITOR $HOME/.zinit.zsh'
alias nvimrc='$EDITOR $HOME/.config/nvim/init.vim'
alias bsprc='$EDITOR $HOME/.config/bspwm/bspwmrc'
alias sxhrc='$EDITOR $HOME/.config/sxhkd/sxhkdrc'
alias trc='$EDITOR $HOME/.tmux.conf'

# reload current shell
if [ -n "$ZSH_VERSION" ]; then
	alias reload="exec zsh -o NO_GLOBAL_RCS"
else
	alias reload="exec bash"
fi

# Exec new shell
alias z="exec zsh -o NO_GLOBAL_RCS"
alias b="exec bash"

# reset
if [[ "$TMUX" ]]; then
	alias reset="clear; tmux clearhist"
else
	alias reset="tput reset"
fi

# wifi
alias wifi="sudo nmtui"

# zsh-only aliases (mostly global aliases)
if [ -n "$ZSH_VERSION" ]; then
	alias -g A="| ack"
	alias -g C="| xclip -selection clipboard"
	alias -g L="| less"
	alias -g NE="2> /dev/null"
	alias -g NUL="&> /dev/null"

	# Remove first dollar in commands
	alias \$=''
fi

# Safe/verbose ops
alias rm="rm -iv"
alias mv="mv -iv"
alias mkdir="mkdir -pv"

# xclip
alias clip="xclip -sel clip <"

# web
fire() { firefox "$1" NUL; }
chrome() { chromium "$1" NUL; }

# rmdir
alias rmd="rmdir --ignore-fail-on-non-empty *"

# Restore dotfiles
alias restore="pushd -q && cd -q ~/.dotfiles && git checkout . && popd -q && reload"

# Download youtube as mp3
alias yget="youtube-dl --extract-audio --audio-format mp3"

# Don't record in history.
alias vlc=" vlc"

# Screenshot
ss() { gnome-screenshot NUL -d "${1:-10}" & }

# Brightness
alias x="xbacklight"
alias x+="xbacklight -inc 10"
alias x-="xbacklight -dec 1"
alias xmax="xbacklight -inc 100"
alias xmin="xbacklight -inc 100 && xbacklight -dec 99"
alias xg="xbacklight -get"

# Use make without printing the input and automatically use parallel jobs.
alias make="make -j -s"

# So ag doesn't print "Permission denied"
alias ag="ag --hidden --silent --ignore .git"

# Make commands human-readable.
alias du="du -h"
alias df="df -h"
alias free="free -h"

# Fast tmux
alias t="tmux"

# Print PATH and fpath
alias path="tr ':' '\n' <<< $PATH"
alias fpath="tr ':' '\n' <<< $FPATH"

# Allows leaving from deleted directories
alias ..='command .. 2>/dev/null || cd $(dirname $PWD)'

# allow sudo to expand aliases as well as run anything in $PATH
alias sudo='sudo env PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"  '

# Alias for quick virtual environment activation.
alias activate="source .virtual_environment*/bin/activate"

# List explicitly installed packages by date.
late() {
	reset
	output=$(expac -Qs --timefmt="%y/%m/%d" "%l {%w} {%G} %n" | sort | grep explicit)
	echo $output
}
