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

alias ice="zpl ice silent depth'1'"
alias snip="zpl snippet"
alias light="zpl light"
alias load="zpl load"

#ice id-as"icons-in-terminal" cloneonly nocompile atclone"./install.sh"; light sebastiencs/icons-in-terminal

ice id-as"LS_COLORS" atpull"%atclone" pick"clrs.zsh" nocompile"!" atclone"
  sed -i '/DIR/c\DIR 34;40' LS_COLORS
  dircolors -b LS_COLORS > clrs.zsh"
light trapd00r/LS_COLORS

ice id-as"editor" atinit"
  zstyle ':prezto:module:editor' dot-expansion 'yes'
  zstyle ':prezto:module:editor' key-bindings 'vi' "
snip PZT::modules/editor/init.zsh

ice id-as"fzf" atclone"./install" atload"source ~/.fzf.zsh"
light junegunn/fzf

ice id-as"history" atload"
  unsetopt hist_beep
  unalias history-stat" 
snip PZT::modules/history/init.zsh

ice id-as"zsh-saneopt" wait; light willghatch/zsh-saneopt

ice id-as"completion" wait blockf;
snip PZT::modules/completion/init.zsh

ice id-as"zsh-autosuggestions" wait atload"
  _zsh_autosuggest_start
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
  bindkey '^ ' autosuggest-accept"
light zsh-users/zsh-autosuggestions

ice id-as"fast-syntax-highlighting" wait atinit"
  zpcompinit
  zpcdreplay"
light zdharma/fast-syntax-highlighting

ice id-as"zsh-diff-so-fancy" wait"1" has"git"
light zdharma/zsh-diff-so-fancy

ice id-as"git-open" wait"1" has"git"
light paulirish/git-open

ice id-as"forgit" wait"1" has"git" atload"unalias gi gcf gss gclean"
light wfxr/forgit

ice id-as"zsh-colored-man-pages" wait"1"
light ael-code/zsh-colored-man-pages

# Themes
PS1="~ "

GEOMETRY_COLOR_DIR=152
ice cloneonly id-as"geometry" atload"prompt_geometry_render"
light geometry-zsh/geometry

ice cloneonly id-as"pure" pick"async.zsh" src"pure.zsh"
light sindresorhus/pure

ice id-as"powerlevel10k" wait"!" atload"source ~/.p10k.zsh; _p9k_precmd" nocd
light romkatv/powerlevel10k

# End of themes

unalias ice snip light load
