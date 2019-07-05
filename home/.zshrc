# Install all missing programs

# zplugin
if [ ! -d "${HOME}/.zplugin" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

# prezto
if [ ! -d "${HOME}/.zprezto" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
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

# Include prezto
zstyle ':prezto:*:*' case-sensitive 'yes'
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:editor' key-bindings 'vi'
zstyle ':prezto:module:editor' dot-expansion 'yes'

zstyle ':prezto:load' pmodule \
  'archive' \
  'history-substring-search' 

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# zplugin
source '/home/dundar/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

alias ice="zpl ice"
alias snip="zpl snippet"
alias light="zpl light"

ice cloneonly atclone"./install"; light junegunn/fzf

snip PZT::modules/environment/init.zsh
snip PZT::modules/command-not-found/init.zsh
snip PZT::modules/history/init.zsh
snip PZT::modules/completion/init.zsh
ice atload"ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'; bindkey '^ ' autosuggest-accept"; light zsh-users/zsh-autosuggestions

ice; light djui/alias-tips
ice; light zdharma/fast-syntax-highlighting
ice; light zdharma/zsh-diff-so-fancy
ice; light zuxfoucault/colored-man-pages_mod
ice atload"POWERLEVEL9K_PROMPT_ON_NEWLINE=true; POWERLEVEL9K_DISABLE_RPROMPT=true; POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)"; light romkatv/powerlevel10k
ice cloneonly atclone"./install.sh"; light sebastiencs/icons-in-terminal

unalias zplg snip light ice 

# Enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh || zpl delete junegunn/fzf
