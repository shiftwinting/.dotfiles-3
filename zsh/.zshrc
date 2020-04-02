######################################################
# 
# Install all missing programs
# 

# zinit
if [ ! -d "${HOME}/.zinit" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

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


PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

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

# Syntax highlighter "needs" to be last.

ice wait"1" atinit"
  zpcompinit
  zpcdreplay"
load zdharma/fast-syntax-highlighting

unalias ice snippet load z
