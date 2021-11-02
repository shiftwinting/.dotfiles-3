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

zinit ice silent depth'1' id-as'auto' atclone"./install --key-bindings --completion --no-update-rc" atload"source ~/.fzf.zsh"
zinit light junegunn/fzf

zinit ice silent depth'1' wait id-as"completion" blockf;
zinit snippet PZT::modules/completion/init.zsh

zinit ice silent depth'1' id-as'auto' wait atinit"export ENHANCD_DISABLE_HOME=1"
zinit light b4b4r07/enhancd

# Syntax highlighter "needs" to be last.

zinit ice silent depth'1' id-as'auto' wait"1" atinit"
zpcompinit
zpcdreplay"
zinit light zdharma/fast-syntax-highlighting
