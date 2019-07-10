# Install all missing programs

# zplugin
if [ ! -d "${HOME}/.zplugin" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

# vim-plug
if [ ! -e "${HOME}/.local/share/nvim/site/autoload/plug.vim" ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

######################################################

# Allow .. without getting "Permission denied"
setopt autocd

# Set neovim as default editor and reader.
export EDITOR=nvim
export VISUAL=nvim

# [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey '^[[1;5D' backward-word

# zplugin
source '/home/dundar/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

alias ice="zpl ice silent"
alias snip="zpl snippet"
alias light="zpl light"

ice atload"
  unsetopt HIST_BEEP
  unalias history-stat"
snip PZT::modules/history/init.zsh

ice atclone"./install" atload"source ~/.fzf.zsh"; light junegunn/fzf

ice wait"1"; light djui/alias-tips

ice wait"1"; light zdharma/zsh-diff-so-fancy

ice wait"1"; light zuxfoucault/colored-man-pages_mod

ice atload"
  POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  POWERLEVEL9K_DISABLE_RPROMPT=true 
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)" 
light romkatv/powerlevel10k

ice wait"1" cloneonly atclone"./install.sh"; light sebastiencs/icons-in-terminal

ice wait"1" has"git"; light paulirish/git-open

ice wait"1" has"git" atload"unalias gi gcf gss gclean"
light wfxr/forgit

ice wait"1"; light hcgraf/zsh-sudo

ice wait pick'manydots-magic' compile'manydots-magic'
light knu/zsh-manydots-magic

ice wait blockf; snip PZT::modules/completion/init.zsh

ice wait atload"
  _zsh_autosuggest_start
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
  bindkey '^ ' autosuggest-accept"
light zsh-users/zsh-autosuggestions

ice wait atinit"
  zpcompinit
  zpcdreplay"
light zdharma/fast-syntax-highlighting

unalias zplg snip light ice 
