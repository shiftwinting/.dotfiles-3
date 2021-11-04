function build-uncrustify-latest
	set uncrustify_path "$HOME/programs/uncrustify"
	set uncrustify_build_path "$uncrustify_path/build"

  git -C $uncrustify_path pull

  cmake -S $uncrustify_path -B $uncrustify_build_path -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release 
  cmake --build $uncrustify_build_path

  command cp -f $uncrustify_build_path/compile_commands.json $uncrustify_path
end
