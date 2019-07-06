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
  'history-substring-search' 

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# zplugin
source '/home/dundar/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

alias ice="zpl ice"
alias ice0="ice wait"0" lucid"
alias ice1="ice wait"1" lucid"
alias snip="zpl snippet"
alias light="zpl light"

ice cloneonly atclone"./install"; light junegunn/fzf

snip PZT::modules/environment/init.zsh
ice atload"unalias history-stat"; snip PZT::modules/history/init.zsh
ice1; light djui/alias-tips
ice1; light zdharma/zsh-diff-so-fancy
ice1; light zuxfoucault/colored-man-pages_mod
ice atload"POWERLEVEL9K_PROMPT_ON_NEWLINE=true; POWERLEVEL9K_DISABLE_RPROMPT=true; POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)"; light romkatv/powerlevel10k
ice1 cloneonly atclone"./install.sh"; light sebastiencs/icons-in-terminal

ice0 blockf; light zsh-users/zsh-completions
ice0 atload"_zsh_autosuggest_start; ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'; bindkey '^ ' autosuggest-accept"; light zsh-users/zsh-autosuggestions
ice0 atinit"zpcompinit; zpcdreplay"; light zdharma/fast-syntax-highlighting

unalias zplg snip light ice ice0 ice1

# Enable fzf
source ~/.fzf.zsh 

# Enable command not found
source /usr/share/doc/find-the-command/ftc.zsh
