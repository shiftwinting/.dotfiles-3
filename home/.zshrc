# Install all missing programs

# zplugin
if [ ! -d "${HOME}/.zplugin" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

# vim-plug
if [ ! -e "${HOME}/.local/share/nvim/site/autoload/plug.vim" ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

###########################################################################################################
# Allow .. without getting "Permission denied"
setopt autocd

# Set neovim as default editor and reader.
export EDITOR=nvim
export VISUAL=nvim

# zplugin
source '/home/dundar/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

alias ice="zpl ice"
alias ice0="ice wait lucid"
alias ice1="ice wait"1" lucid"
alias snip="zpl snippet"
alias light="zpl light"

ice atload"
  unsetopt HIST_BEEP
  unalias history-stat"
snip PZT::modules/history/init.zsh

ice atinit"
  zstyle ':prezto:module:editor' key-bindings 'vi'
  zstyle ':prezto:module:editor' dot-expansion 'yes'"
snip PZT::modules/editor/init.zsh

ice atclone"./install" atload"source ~/.fzf.zsh"; light junegunn/fzf

ice1; light djui/alias-tips

ice1; light zdharma/zsh-diff-so-fancy

ice1; light zuxfoucault/colored-man-pages_mod

ice atload"
  POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  POWERLEVEL9K_DISABLE_RPROMPT=true 
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)" 
light romkatv/powerlevel10k

ice1 cloneonly atclone"./install.sh"; light sebastiencs/icons-in-terminal

ice0 blockf; snip PZT::modules/completion/init.zsh

ice0 atload"
  _zsh_autosuggest_start
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
  bindkey '^ ' autosuggest-accept"
light zsh-users/zsh-autosuggestions

ice0 atinit"
  zpcompinit
  zpcdreplay"
light zdharma/fast-syntax-highlighting

unalias zplg snip light ice ice0 ice1
