#!/bin/bash

alias ls="exa"

install() {
	$HOME/.dotfiles/bin/.bin/install "$@"
}

alias show="yay -Si"
alias search="yay -Ss"
alias fsearch="yay -F"
alias remove="yay -Rs"
alias mirror="sudo pacman-mirrors -id"
alias orphan='yay -Qdtq | yay -Rs -'

# git
alias amend="git commit --amend --no-verify --allow-empty"
alias good="git bisect good"
alias bad="git bisect bad"
alias bisect="git bisect start"
alias gac="git add .; git commit"
alias gap="git add -p"
alias gb="git branch"
alias gba="git branch --all"
alias gbd="git branch --delete"
gbdr() {
	git push origin --delete "$@"
}
gbdd() {
	git push origin --delete "$@"
	git branch -D "$@"
}
alias gbD="git branch -D"
alias gbu="git branch --unset-upstream"
alias gc="git commit"
gcbb() {
	git checkout -b "$@"
	git push --set-upstream origin "$@"
}
gcd() {
	root_path="$(git rev-parse --show-toplevel)" || return
	cd "$root_path"
}
gcf() {
	modified_file_full_path="$(git status --porcelain | awk '{print $2}')"
	modified_file="$(basename $modified_file_full_path)"
	git add -A
	git commit -m "$modified_file"
}
alias gd="forgit::diff"
alias gdw="git diff --word-diff-regex='\w*'"
alias gdc="forgit::diff --cached"
alias gdcw="git diff --cached --word-diff-regex='\w*'"
alias gcl="git clone --recursive"
alias gcl1="git clone --depth=1"
alias gclc="git clean -fd :/"
alias gch="git cherry-pick"
alias gcn="git commit --no-verify"
alias gco="git checkout"
alias gis="git switch"
alias gf="git add .; git commit -m 'chore: quick update, squash later'"
alias gfn="git add .; git commit --no-verify -m 'chore: quick update, squash later'"
alias gt="git add .; git commit -m 'chore: test commit, will likely delete after'"
alias gk="gitk"
alias gl="git log --graph --full-history --pretty --oneline"
alias gla="gl --all"
alias glr="forgit::log HEAD..origin"
alias gls="git log --stat --oneline"
alias gp="git push --quiet"
gps() {
	current_branch=$(git rev-parse --abbrev-ref HEAD)
	git push --set-upstream origin "$current_branch"
}
alias gpa="git push --all"
alias gpl="git pull"
alias gpla="git pull --all"
alias gpf='git push --force-with-lease --quiet'
alias gpf!='git push --force'
alias gpt="git push --tags"
alias gr="git remote"
alias grr="git remote remove"
alias gra="git rebase --abort"
alias grem="git rebase master"
alias groot="git rebase --root -i"
alias gres="git restore"
gri() {
	git rebase -i HEAD~"${1:-10}"
}
alias gs="git status"
alias gst="git diff --stat-count=1"
alias gopen="git open"

alias gl1="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias up="git upstream"
git-add-upstream(){
  git remote add upstream "$@"
}
alias sync="hub sync"

# vim
alias vi='$EDITOR'
alias svi='sudo $EDITOR'

#ls
alias la="ls -a"
alias ll="la -l"

# goto
alias d="cd $HOME/.dotfiles"
alias c="cd $HOME/.dotfiles/config/.config"
alias zs="cd $HOME/.zinit/snippets"
alias zp="cd $HOME/.zinit/plugins"
alias zb="cd $HOME/.zinit/bin"
alias ds="cd $HOME/.dotfiles/shells"
alias ft="cd $HOME/.config/nvim/ftplugin"
alias bin="cd $HOME/.dotfiles/bin/.bin"

#config
alias ali='$EDITOR $HOME/.aliases.sh'
alias rc='$EDITOR $HOME/.zshrc'
alias brc='$EDITOR $HOME/.bashrc'
alias zenv='$EDITOR $HOME/.zshenv'
alias zi='$EDITOR $HOME/.zinit.zsh'
alias vimrc='$EDITOR $HOME/.config/nvim/init.vim'
alias bsprc='$EDITOR $HOME/.config/bspwm/bspwmrc'
alias sxhrc='$EDITOR $HOME/.config/sxhkd/sxhkdrc'
alias trc='$EDITOR $HOME/.tmux.conf'
alias gconf='$EDITOR $HOME/.gitconfig'

# reload current shell
if [ -n "$ZSH_VERSION" ]; then
	alias reload="exec zsh -o NO_GLOBAL_RCS"
else
	alias reload="exec bash"
fi

# Exec new shell
alias z="exec zsh -o NO_GLOBAL_RCS"
alias b="exec bash"

# reset
if [[ "$TMUX" ]]; then
	alias reset="clear; tmux clearhist"
else
	alias reset="tput reset"
fi

# wifi
alias wifi="sudo nmtui"

# zsh-only aliases (mostly global aliases)
if [ -n "$ZSH_VERSION" ]; then
	alias -g A="| ack"
	alias -g R="| rg"
	alias -g C="| xclip -selection clipboard"
	alias -g L="| less"
	alias -g NE="2> /dev/null"
	alias -g NUL="&> /dev/null"

	# Remove first dollar in commands
	alias \$=''
fi

# Safe/verbose ops
alias rm="rm -iv"
alias mv="mv -iv"
alias cp="cp -iv"
alias mkdir="mkdir -pv"

# xclip
alias clip="xclip -sel clip <"

# web
fire() {
	firefox "$1" NUL
}
chrome() {
	google-chrome-stable "$1" NUL
}

# rmdir
alias rmd="rmdir * 2>/dev/null"

# Restore dotfiles
alias restore="pushd -q && cd -q ~/.dotfiles && git checkout . && popd -q && reload"

# Download youtube as mp3
alias yget="youtube-dl --extract-audio --audio-format mp3"

# Don't record in history.
alias vlc=" vlc"

# Screenshot
ss() {
	gnome-screenshot NUL -d "${1:-2}" &
}

# Brightness
alias x="brightnessctl set"
alias x+="brightnessctl set +3%"
alias x-="brightnessctl set 3%-"
alias xmax="brightnessctl set 100%"
alias xmin="brightnessctl set 1%"

# Use make without printing the input and automatically use parallel jobs.
alias make="make -s"

# So ag doesn't print "Permission denied"
alias ag="ag --hidden --smart-case --silent --ignore .git"

# Make commands human-readable.
alias du="du -h"
alias df="df -h"
alias free="free -h"

# Fast tmux
alias t="tmux"

# Print human-readable PATH and FPATH
alias path="tr ':' '\n' <<< $PATH | sort"
alias fpath="tr ':' '\n' <<< $FPATH | sort"

# allow sudo to expand aliases as well as run anything in $PATH
alias sudo='sudo env PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"	'

# Function for quick virtual environment activation.
activate() {
	activate_file="$(find . -type f -name "activate")"
	number_of_files=$(echo $activate_file | wc -l)

	if ((number_of_files == 0)); then
		echo "No activate file found. Exiting."
		return 1
	elif ((number_of_files > 1)); then
		echo "Multiple activate files found:"
		echo "$activate_file"
		echo "Exiting."
		return 1
	fi

	source $activate_file
}

alias logout="loginctl terminate-user dundar"

alias hook="cd .git/hooks"

alias virtual="python -m venv .venv"

alias ch="reset; shellcheck -x -e SC2086"
alias chs="ch -S style"
alias chi="ch -S info"
alias chw="ch -S warning"
alias che="ch -S error"

alias q="shellcheck -f diff"

chr() {
	reset
	find . -name "*.sh" -exec shellcheck -x -W 0 -e SC2086 "$@" {} \;
}

chra() {
	reset
	find . -type f -exec shellcheck -x -W 0 -e SC2086 "$@" {} \;
}

alias fo="shfmt -w -s"

lower() {
	for filename in "$@"; do
		filename_lower=$(echo $filename | tr '[:upper:]' '[:lower:]')
		mv -n $filename $filename_lower
	done
}

alias rename="perl-rename -i"

alias detox="detox -s lower"

vmprof() {
	python -m vmprof --lines -o results.dat pre-commit
	vmprofshow --lines results.dat | less
	rm -f results.dat
}

alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'

mpv() {
	command mpv ${@:-*}
}

mp4copy() {
	ffmpeg -i $1 -c copy ${1%.*}.mp4
}

alias scc='scc --no-complexity --no-cocomo'

nuke() {
	if [[ $(pwd) != /home/dundar/programs/nvim-typo ]]; then
		echo "RUNNING DANGEROUS COMMAND OUTSITE OF TESTING AREA. ABORT"
		return 1
	fi

	while read -r branch; do
		[[ -n $branch ]] || continue

		git push origin --delete "$branch"
	done <<<"$(git branch --remotes | grep -v "main" | grep -v "master" | grep -v "HEAD" | sed 's|origin/||')"

	while read -r branch; do
		[[ -n $branch ]] || continue

		git branch -D "$branch"
	done <<<"$(git branch | grep -v main | grep -v master)"
}

gooo() {
  #nuke
	#branch="$*"
	#gcbb "$branch"
	#git commit --allow-empty -m "$branch"
  #gp
	#gh pr create --fill
  #gis master

  nuke
	branch="$*"
	gcbb "$branch"
	sed -i "s|$branch||g" src/nvim/highlight.c
	git add -A
	git commit -m "$branch"
	git push
	gh pr create --fill
	gh pr edit --add-label typo
	git switch master
}

build() {
	local neovim_path="$HOME/programs/neovim"

	make -C "$neovim_path" CMAKE_INSTALL_PREFIX="$neovim_path"

  command cp -f $HOME/programs/neovim/build/compile_commands.json $HOME/programs/neovim/
}

buildinstall(){
	local neovim_path="$HOME/programs/neovim"

	make -C "$neovim_path" CMAKE_INSTALL_PREFIX="$neovim_path" CMAKE_BUILD_TYPE=RelWithDebInfo
	make -C "$neovim_path" install
}

build-uncrustify() {
	local uncrustify_build_path="$HOME/programs/uncrustify/build"

  mkdir -p $uncrustify_build_path

  (
    cd $uncrustify_build_path >/dev/null
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release ..
    cmake --build .
  )

  command cp -f $HOME/programs/uncrustify/build/compile_commands.json $HOME/programs/uncrustify/
}

build-vim(){
	local vim_path="$HOME/programs/vim"

  (
    cd $vim_path >/dev/null
    touch src/**/*
    bear -- make -j
  )
}

alias black="black -C"

alias cl='clang-format -i'
alias un='uncrustify -c $HOME/programs/neovim/src/uncrustify.cfg --replace --no-backup'
alias bun='$HOME/programs/uncrustify/build/uncrustify -c $HOME/programs/neovim/src/uncrustify.cfg --replace --no-backup'
alias clint='$HOME/programs/neovim/src/clint.py'
alias unc-update='uncrustify -c $HOME/programs/neovim/src/uncrustify.cfg --update-config-with-doc -o $HOME/programs/neovim/src/uncrustify.cfg'
alias bunc-update='$HOME/programs/uncrustify/build/uncrustify -c $HOME/programs/neovim/src/uncrustify.cfg --update-config-with-doc -o $HOME/programs/neovim/src/uncrustify.cfg'

form()(
  setopt null_glob
  nvim_path="$HOME/programs/neovim/src/nvim"

  unc-update

  format_files=(
    "$nvim_path"/indent.c
    "$nvim_path"/if_cscope.c
    "$nvim_path"/rbuffer.c
    "$nvim_path"/runtime.c
  )

  format_files+=("$nvim_path"/{api,eval,event,lua,msgpack_rpc,os,tui,viml}/**/*.{c,h})
  format_files+=("$nvim_path"/{a..h}*.c)
  format_files+=("$nvim_path"/{j..q}*.c)
  format_files+=("$nvim_path"/{s..z}*.c)

  for i in "${format_files[@]}"; do
    un "$i" &
  done; wait

)

tidy(){
  for i in "$@"; do
    clang-tidy -fix --config-file "$HOME/.clang-tidy" "$i"
  done
}

alias codespell="codespell --config $HOME/.codespellrc"

vs(){
  while read -r file; do rg -iH "Maintainer:.*$@" $file; done <<< $(codespell | awk -F: '{print $1}' | sort -u)
}

pre-commit-enable(){
  root=$(git rev-parse --show-toplevel)
  hook_path=$root/.git/hooks
  mv $hook_path/pre-commit-disable $hook_path/pre-commit
}

pre-commit-disable(){
  root=$(git rev-parse --show-toplevel)
  hook_path=$root/.git/hooks
  mv $hook_path/pre-commit $hook_path/pre-commit-disable
}

countcast(){
  for i in char char_u; do
    rg "\((const)? *$i *\**\)" --stats --quiet **/*.c **/*.h | head -n2
  done | grep . | awk '{print $1}' | paste -sd+ | bc
}

vp1(){
  file="$1"
  file_basename="$(basename "$1")"

  if [[ $file_basename != *.c && $file_basename != *.h ]]; then
    return
  fi

  rm -f after.c before.c

  cp -f $file after.c
  un after.c

  git uncommit

  cp -f $file before.c
  un before.c

  diff -Naur before.c after.c > vim-patch

  sed -i "s|before.c|a/src/nvim/$file_basename|" vim-patch
  sed -i "s|after.c|b/src/nvim/$file_basename|" vim-patch

  mv -f vim-patch $HOME/programs/neovim

  (
  cd $HOME/programs/neovim
  patch -p1 -N -t --no-backup-if-mismatch < vim-patch
  )
}

vp(){
  rm -f **/*.rej *.patch
  version="$1"
  scripts/vim-patch.sh -p "$version"

  patch -p1 -N -t --no-backup-if-mismatch < *.patch

  (
  cd .vim-src
  git checkout "$version"

  while read -r file; do
    git checkout "$version"
    vp1 "$file"
  done <<< "$(git diff-tree --no-commit-id --name-only -r $version)"

  git checkout master
  )

  rm -f vim-patch **/*.orig
}
