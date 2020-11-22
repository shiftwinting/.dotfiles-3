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

#ice id-as"icons-in-terminal" cloneonly nocompile atclone"./install.sh"
#load sebastiencs/icons-in-terminal

zinit ice silent depth'1' id-as'auto' atinit"
zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:editor' key-bindings 'vi' "
zinit snippet PZT::modules/editor/init.zsh

zinit ice silent depth'1' id-as'auto' atclone"./install --key-bindings --completion --no-update-rc" atload"source ~/.fzf.zsh"
zinit load junegunn/fzf

zinit ice silent depth'1' id-as'auto' wait pick'async.zsh'
zinit load mafredri/zsh-async

zinit ice silent depth'1' id-as'auto' wait
zinit load willghatch/zsh-saneopt

zinit ice silent depth'1' wait id-as"completion" blockf;
zinit snippet PZT::modules/completion/init.zsh

zinit ice silent depth'1' id-as'auto' wait atinit"export ENHANCD_DISABLE_HOME=1"
zinit load b4b4r07/enhancd

zinit ice silent depth'1' id-as'auto' wait atload"
_zsh_autosuggest_start
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
bindkey '^ ' autosuggest-accept"
zinit load zsh-users/zsh-autosuggestions

PS1="- "
zinit ice silent depth'1' id-as'auto' wait"!" pick"async.zsh" src"pure.zsh"
zinit load sindresorhus/pure

zinit ice silent depth"1" id-as"auto" wait"1" has"git" 
zinit load zdharma/zsh-diff-so-fancy

zinit ice silent depth"1" id-as"auto" wait"1" has"git" atload"unalias gi gcf gss gclean" 
zinit load wfxr/forgit

zinit ice silent depth"1" id-as"auto" wait"1"
zinit load ael-code/zsh-colored-man-pages

zinit ice silent depth"1" id-as"auto" wait"1"
zinit load laggardkernel/zsh-thefuck

zinit ice silent depth"1" id-as"auto" wait"1"
zinit load mollifier/cd-gitroot

zinit ice silent depth"1" id-as"auto" wait"1"
zinit load hlissner/zsh-autopair

zinit ice silent depth'1' id-as'auto' wait"1"
zinit load tmux-plugins/tpm

# Syntax highlighter "needs" to be last.

zinit ice silent depth'1' id-as'auto' wait"1" atinit"
zpcompinit
zpcdreplay"
zinit load zdharma/fast-syntax-highlighting
