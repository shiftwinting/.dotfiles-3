function cleanbuild
	set neovim_path "$HOME/programs/neovim"

	clear
	rm -rf $neovim_path/build

	make -C "$neovim_path" CMAKE_INSTALL_PREFIX="$neovim_path"

	command cp -f $HOME/programs/neovim/build/compile_commands.json $HOME/programs/neovim/
end
