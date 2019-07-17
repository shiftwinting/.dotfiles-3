# Remove first dollar in commands
alias \$=''

# vim
alias vi="nvim"
alias svi="sudo nvim"

# ls
alias ls="~/.dotfiles/.Misc/ls --color=auto --group-directories-first -X"
alias la="ls -A"
alias ll="la -l"

# pacman
alias install="yay -S --needed --nocleanmenu --nodiffmenu --removemake"
alias show="yay -Si"
alias search="yay -Ss"
alias list="reset; yay -Qe"
alias remove="yay -Rs"
alias up="source ~/.dotfiles/.Misc/upgrade.sh"
alias mirror="sudo pacman-mirrors --geoip"
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
alias kit="cd ~/.config/kitty/kitty-themes/themes"

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
alias gac="git add .; gc"
alias gb="git branch"
alias gc="git commit"
alias gcl="git clone"
alias gcl1="git clone --depth=1"
alias gco="git checkout"
alias gf="git add .; gc -m 'quick update'"
alias gl="forgit::log"
alias gp="git push"
alias gpF="git push -f"
alias gra="git rebase --abort "
alias gri="git rebase -i --root"
alias gs="git status"
alias go="git open"

# wifi
alias wifi="sudo nmtui connect"

# gantenbein
alias ssha="source ~/.runSSH"

# Global alias
alias -g A="| ack"
alias -g T="| tail"
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
alias fire="firefox &> /dev/null &"
function chrome() {chromium $1 NUL}

# rmdir
alias rmd="rmdir *"

# Restore dotfiles
alias restore="d && gco ."

# date of 90 days prior
alias 90='date +%Y:%m:%d -d "90 day ago"'

#####################
# Functions

# Automatically run ls after using cd.
function chpwd(){la}
