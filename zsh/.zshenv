PATH=$(ruby -e 'puts Gem.user_dir')/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

HISTFILE=$XDG_CACHE_HOME/zhistory # The path to the history file.
HISTSIZE=10000                    # The maximum number of events to save in the internal history.
export SAVEHIST=10000             # The maximum number of events to save in the history file.

export EDITOR=nvim # Set neovim as default editor.
export VISUAL=nvim # Set neovim as default reader.
