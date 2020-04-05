######################################################
# 
# Install all missing programs
# 

# vim-plug
if [ ! -e "${HOME}/.local/share/nvim/site/autoload/plug.vim" ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

######################################################
#
# General options
#

zstyle ':*:*:*' case-sensitive 'yes'	# Case sensitive completion.
setopt auto_cd				# Allow .. without getting "Permission denied".
setopt extendedglob			# Add additional features for identifying files. 

bindkey '^[[1;5C' forward-word		# [Ctrl-RightArrow] - move forward one word.
bindkey '^[[1;5D' backward-word		# [Ctrl-LeftArrow] - move backward one word.

# Automatically attach tmux session named ssh-tmux. If it doesn't exist then just create a new one.
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
	export TERM=xterm-256color		# Set the term variable if I'm using SSH so my terminal (kitty) doesn't break.
    	tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi

######################################################
#
# Alias
#

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

# Download youtube as mp3
alias yget="youtube-dl --extract-audio --audio-format mp3"

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


######################################################
#
# Zinit
# 

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p $HOME/.zinit
    command git clone https://github.com/zdharma/zinit $HOME/.zinit/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

alias z="zinit silent depth"1" light-mode id-as"auto""
alias ice="zinit ice silent depth'1' id-as'auto'"
alias snippet="zinit snippet"
alias load="zinit light"

#ice id-as"icons-in-terminal" cloneonly nocompile atclone"./install.sh"
#load sebastiencs/icons-in-terminal

ice atinit"
  zstyle ':prezto:module:editor' dot-expansion 'yes'
  zstyle ':prezto:module:editor' key-bindings 'vi' "
snippet PZT::modules/editor/init.zsh

ice atclone"./install" atload"source ~/.fzf.zsh"
load junegunn/fzf

ice id-as"history" atload"
  unsetopt hist_beep
  unalias history-stat" 
snippet PZT::modules/history/init.zsh

ice wait pick'async.zsh'
load mafredri/zsh-async

ice wait
load willghatch/zsh-saneopt

ice wait id-as"completion" blockf;
snippet PZT::modules/completion/init.zsh

ice wait atinit"export ENHANCD_DISABLE_HOME=1"
load b4b4r07/enhancd

ice wait atload"
  _zsh_autosuggest_start
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
  bindkey '^ ' autosuggest-accept"
load zsh-users/zsh-autosuggestions

PS1="- "
ice wait"!" pick"async.zsh" src"pure.zsh"
load sindresorhus/pure

z wait"1" for \
	has"git" zdharma/zsh-diff-so-fancy \
	has"git" paulirish/git-open \
	has"git" atload"unalias gi gcf gss gclean" wfxr/forgit \
	ael-code/zsh-colored-man-pages \
	laggardkernel/zsh-thefuck \
	mollifier/cd-gitroot \
	hlissner/zsh-autopair \

ice wait"1" atpull"%atclone" pick"clrs.zsh" nocompile"!" atclone"
  sed -i '/DIR/c\DIR 34;20' LS_COLORS
  dircolors -b LS_COLORS > clrs.zsh"
load trapd00r/LS_COLORS

ice wait"1"
load tmux-plugins/tpm

# Syntax highlighter "needs" to be last.

ice wait"1" atinit"
  zpcompinit
  zpcdreplay"
load zdharma/fast-syntax-highlighting

unalias ice snippet load z
