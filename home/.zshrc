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
setopt no_beep				# Don't beep on error.

# History options
setopt bang_hist			# Treat the '!' character specially during expansion.
setopt extended_history         	# Write the history file in the ':start:elapsed;command' format.
setopt share_history            	# Share history between all sessions.
setopt hist_expire_dups_first   	# Expire a duplicate event first when trimming history.
setopt hist_ignore_dups         	# Do not record an event that was just recorded again.
setopt hist_ignore_all_dups     	# Delete an old recorded event if a new event is a duplicate.
setopt hist_find_no_dups        	# Do not display a previously found event.
setopt hist_ignore_space        	# Do not record an event starting with a space.
setopt hist_save_no_dups        	# Do not write a duplicate event to the history file.
setopt hist_verify              	# Do not execute immediately upon history expansion.

HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"	# The path to the history file.
HISTSIZE=10000                   	# The maximum number of events to save in the internal history.
SAVEHIST=10000                   	# The maximum number of events to save in the history file.

# Completion options
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a successive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
setopt EXTENDED_GLOB       # Needed for file modification glob modifiers with compinit
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.

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

#ice cloneonly nocompile atclone"./install.sh"; light sebastiencs/icons-in-terminal

ice atclone"./install" atload"source ~/.fzf.zsh"; light junegunn/fzf

ice atload"
  POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  POWERLEVEL9K_DISABLE_RPROMPT=true 
  POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=true
  POWERLEVEL9K_BATTERY_HIDE_ABOVE_THRESHOLD=20
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs background_jobs disk_usage battery)"
light romkatv/powerlevel10k

ice wait blockf;
light zsh-users/zsh-completions

ice wait atload"
  _zsh_autosuggest_start
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
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

ice wait"1"; light zuxfoucault/colored-man-pages_mod

ice wait"1"; light hcgraf/zsh-sudo

unalias zplg snip light ice
