function build-uncrustify
	set uncrustify_path "$HOME/programs/uncrustify"
	set uncrustify_build_path "$uncrustify_path/build"

  git -C $uncrustify_path reset --hard 0dfafb27

  cmake -S $uncrustify_path -B $uncrustify_build_path -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release 
  cmake --build $uncrustify_build_path
end
