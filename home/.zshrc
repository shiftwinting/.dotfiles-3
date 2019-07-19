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

export EDITOR=nvim			# Set neovim as default editor.
export VISUAL=nvim			# Set neovim as default reader.

bindkey '^[[1;5C' forward-word		# [Ctrl-RightArrow] - move forward one word.
bindkey '^[[1;5D' backward-word		# [Ctrl-LeftArrow] - move backward one word.

######################################################
#
# Zplugin
# 

source '/home/dundar/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

alias ice="zpl ice silent"
alias snip="zpl snippet"
alias light="zpl light"
alias load="zpl load"

#ice cloneonly nocompile atclone"./install.sh"; light sebastiencs/icons-in-terminal

ice atclone"dircolors -b LS_COLORS > clrs.zsh" atpull"%atclone" pick"clrs.zsh" nocompile"!"
light trapd00r/LS_COLORS

ice atclone"./install" atload"source ~/.fzf.zsh"; light junegunn/fzf

ice atload"
  unsetopt hist_beep
  unalias history-stat" 
light DundarGoc/prezto-history

ice atload"
  POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  POWERLEVEL9K_DISABLE_RPROMPT=true 
  POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=true
  POWERLEVEL9K_BATTERY_HIDE_ABOVE_THRESHOLD=20
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs background_jobs disk_usage battery)"
light romkatv/powerlevel10k

ice wait; light willghatch/zsh-saneopt

ice wait blockf atclone"echo 'Download complete!'";
light DundarGoc/prezto-completion

ice wait atload"
  _zsh_autosuggest_start
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'
  bindkey '^ ' autosuggest-accept"
light zsh-users/zsh-autosuggestions

ice atinit"
  zpcompinit
  zpcdreplay"
light zdharma/fast-syntax-highlighting

ice wait"1" has"git"; light zdharma/zsh-diff-so-fancy

ice wait"1" has"git"; light paulirish/git-open

ice wait"1" has"git" atload"unalias gi gcf gss gclean"
light wfxr/forgit

ice wait"1"; light djui/alias-tips

ice wait"1"; light ael-code/zsh-colored-man-pages

ice wait"1"; light hcgraf/zsh-sudo

unalias zplg ice snip light load
