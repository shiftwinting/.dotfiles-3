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

ice atclone"./install --key-bindings --completion --no-update-rc" atload"source ~/.fzf.zsh"
load junegunn/fzf

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
  hlissner/zsh-autopair

ice wait"1" atpull"%atclone" pick"clrs.zsh" nocompile"!" atclone"
sed -i '/DIR/c\DIR 34;20' LS_COLORS
dircolors -b LS_COLORS > clrs.zsh"
load trapd00r/LS_COLORS

ice wait"1"
load tmux-plugins/tpm

# Syntax highlighter "needs" to be last.

ice wait"1" atinit"
zpcompinit
zpcdreplay"
load zdharma/fast-syntax-highlighting

unalias ice snippet load z
