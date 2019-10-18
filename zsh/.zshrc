######################################################
# 
# Install all missing programs
# 

# zplugin
if [ ! -d "${HOME}/.zplugin" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
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
setopt globdots				# Dotfiles are matched without explicitly specifying the dot
setopt extendedglob			# Add additional features for identifying files. 

export EDITOR=nvim			# Set neovim as default editor.
export VISUAL=nvim			# Set neovim as default reader.

bindkey '^[[1;5C' forward-word		# [Ctrl-RightArrow] - move forward one word.
bindkey '^[[1;5D' backward-word		# [Ctrl-LeftArrow] - move backward one word.

# Automatically attach tmux session named ssh-tmux. If it doesn't exist then just create a new one.
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
	export TERM=xterm-256color		# Set the term variable if I'm using SSH so my terminal (kitty) doesn't break.
    	tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi

######################################################
#
# Zplugin
# 

source '/home/dundar/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

alias ice="zpl ice silent depth'1'"
alias snip="zpl snippet"
alias light="zpl light"
alias load="zpl load"

#ice id-as"icons-in-terminal" cloneonly nocompile atclone"./install.sh"; light sebastiencs/icons-in-terminal

ice atpull"%atclone" pick"clrs.zsh" nocompile"!" atclone"
  sed -i '/DIR/c\DIR 34;20' LS_COLORS
  dircolors -b LS_COLORS > clrs.zsh"
light trapd00r/LS_COLORS

ice atinit"
  zstyle ':prezto:module:editor' dot-expansion 'yes'
  zstyle ':prezto:module:editor' key-bindings 'vi' "
snip PZT::modules/editor/init.zsh

ice atclone"./install" atload"source ~/.fzf.zsh"
light junegunn/fzf

ice id-as"history" atload"
  unsetopt hist_beep
  unalias history-stat" 
snip PZT::modules/history/init.zsh

ice wait
light willghatch/zsh-saneopt

ice wait id-as"completion" blockf;
snip PZT::modules/completion/init.zsh

ice wait atinit"export ENHANCD_DISABLE_HOME=1"
light b4b4r07/enhancd

ice wait atload"
  _zsh_autosuggest_start
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
  bindkey '^ ' autosuggest-accept"
light zsh-users/zsh-autosuggestions

PS1="- "
ice wait"!" pick"async.zsh" src"pure.zsh"
light sindresorhus/pure

ice wait"1" has"git"
light zdharma/zsh-diff-so-fancy

ice wait"1" has"git"
light paulirish/git-open

ice wait"1" has"git" atload"unalias gi gcf gss gclean"
light wfxr/forgit

ice wait"1"
light ael-code/zsh-colored-man-pages

ice wait"1"
light laggardkernel/zsh-thefuck

ice wait"1" if'[[ -n "$SSH_CONNECTION" ]]' from"gh-r" as"program" mv"pandoc*/bin/pandoc -> pandoc" bpick"*linux*"
light jgm/pandoc

ice wait"1" if'[[ -n "$SSH_CONNECTION" ]]' from"gh-r" as"program" mv"hyperfine*/hyperfine -> hyperfine" bpick"*linux*"
light sharkdp/hyperfine

ice wait"1"
light mollifier/cd-gitroot

ice wait"1" atinit"
  zpcompinit
  zpcdreplay"
light zdharma/fast-syntax-highlighting

unalias ice snip light load
