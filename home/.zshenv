# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# vim
alias vi="nvim"
alias svi="sudo nvim"

# ls
alias ls="~/.dotfiles/.Misc/ls --color=auto --group-directories-first -X"
alias la="ls -A"
alias ll="la -l"

# pacman
alias pacman="sudo pacman"
alias install="pacman -S --needed"
alias yinstall="yay -S --needed --answerclean All --answerdiff None"
alias show="pacman -Si"
alias yshow="yay -Si"
alias search="pacman -Ss"
alias ysearch="yay -Ss"
alias list="yay -Q"
alias remove="pacman -Rs"
alias purge="pacman -Rns"
alias up="source ~/.dotfiles/.Misc/upgrade.sh"
alias mirror="sudo pacman-mirrors --geoip"
alias orphan="yay -Qtd"

# VSCode
alias code="code ."

# goto
alias dot="cd ~/.dotfiles"
alias cfg="cd ~/.dotfiles/config/.config"
alias plug="cd ~/.zplugin"

#config
alias ali="vi ~/.zshenv"
alias rc="vi ~/.zshrc"
alias bsp="vi ~/.config/bspwm/bspwmrc"
alias sxh="vi ~/.config/sxhkd/sxhkdrc"
alias bar="vi ~/.dotfiles/polybar/config.ini"

# reload
alias reload="exec zsh"

# reset
alias reset="tput reset"

# git 
alias ga="git add ."
alias gac="ga; gc"
alias gb="git branch"
alias gc="git commit"
alias gcl="git clone"
alias gco="git checkout"
alias gd="git diff"
alias gds="git diff --staged"
alias gf="ga; gc -m 'quick update'"
alias gl="git plog"
alias gp="git push"
alias gpF="git push -f"
alias gra="git rebase --abort "
alias gri="git rebase -i --root"
alias gs="git status"

# wifi
alias wifi="nmtui connect"

# gantenbein
alias ssha="source ~/.runSSH"

# ack
alias -g A="| ack"

# python
alias py="python3"

# Safe ops
alias rm="rm -iv" 
alias mv="mv -iv" 

# xclip
alias clip="xclip -sel clip <"

# web
alias fire="firefox &> /dev/null &"
alias chrome="chromium &> /dev/null &"

# rmdir
alias rmd="rmdir *"

# Important folder locations
alias -g DOT="~/.dotfiles"

# Restore dotfiles
alias restore="dot; gco ."
#####################
# Functions

# Automatically run ls after using cd.
function chpwd(){ls}
