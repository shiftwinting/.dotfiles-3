PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"
XDG_DATA_DIRS="/usr/local/share:/usr/share"
XDG_CONFIG_DIRS="/etc/xdg"

export EDITOR=nvim			# Set neovim as default editor.
export VISUAL=nvim			# Set neovim as default reader.
