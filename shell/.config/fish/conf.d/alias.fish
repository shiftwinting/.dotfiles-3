alias ls "exa"

alias ag "rg --ignore-case --hidden"

alias install "$HOME/.dotfiles/bin/.bin/install-arch-package"

alias prune "paccache -ruk0"
alias show "yay -Si"
alias search "yay -Ss"
alias fsearch "yay -F"
alias remove "yay -Rs"
alias mirror "sudo pacman-mirrors -id"
alias orphan 'yay -Qdtq | yay -Rs -'

# git
alias abort "git rebase --abort"
alias amend "git commit --amend --no-verify --allow-empty"
alias good "git bisect good"
alias bad "git bisect bad"
alias bisect "git bisect start"

function fix --argument-names 'commit'
	git add -A
	git commit --no-verify --allow-empty --fixup="$commit"
end

alias gac="git add .; git commit"
alias gap="git add -p"
alias gb="git branch"
alias gba="git branch --all"
alias gbd="git branch --delete"
alias gbdr "git push origin --delete"
alias gbD="git branch -D"
alias gbu="git branch --unset-upstream"
alias gc="git commit"
alias gcb="git checkout -b"
#gcbb() {
#	git checkout -b "$@"
#	git push --set-upstream origin "$@"
#}
#gcd() {
#	root_path="$(git rev-parse --show-toplevel)" || return
#	cd "$root_path"
#}
#gcf() {
#	modified_file_full_path="$(git status --porcelain | awk '{print $2}')"
#	modified_file="$(basename $modified_file_full_path)"
#	git add -A
#	git commit -m "$modified_file"
#}
alias gd="git diff"
alias gdw="git diff --word-diff"
alias gdc="git diff --cached"
alias gdcw="git diff --cached --word-diff"
alias gdm "git diff master...(git branch --show-current)" 
alias gcl1="git clone --depth=1"
alias gclc="git clean -fd :/"
alias gch="git cherry-pick"
alias gcn="git commit --no-verify"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gis="git switch"
alias gf="git add .; git commit -m 'chore: quick update, squash later'"
alias gfn="git add .; git commit --no-verify -m 'chore: quick update, squash later'"
alias gt="git add .; git commit -m 'chore: test commit, will likely delete after'"
alias gk="gitk"
alias gl="git log --graph --full-history --pretty --oneline"
alias gla="gl --all"
alias gls="git log --stat --oneline"
alias gp="git push --quiet"
alias gpa="git push --all"
alias gpl="git pull"
alias gpla="git pull --all"
alias gpf='git push --force-with-lease --quiet'
alias gpf!='git push --force'
alias gpt="git push --tags"
alias gr="git remote"
alias grr="git remote remove"
alias gra="git rebase --abort"
alias gre="git rebase"
alias grem="git rebase master"
alias groot="git rebase --root -i"
alias gres="git restore"

alias gs="git status"
alias gst="git diff --stat-count=1"
alias gopen="git open"

alias gl1="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias up="git upstream"
alias git-add-upstream "git remote add upstream"
alias s="hub sync"

# vim
alias vi '$EDITOR'
alias vid "vi -d"
alias svi 'sudo $EDITOR'

#ls
alias la="ls -a"
alias ll="la -l"

# goto
alias cdf="cd $HOME/.dotfiles/shell/.config/fish"
alias cdfc="cd $HOME/.dotfiles/shell/.config/fish/conf.d"
alias cdff="cd $HOME/.dotfiles/shell/.config/fish/functions"
alias cdd="cd $HOME/Downloads"
alias cdn="cd $HOME/programs/neovim"
alias cdnd="cd $HOME/programs/neovim/runtime/doc"
alias cdni="cd $HOME/programs/neovim/.github/workflows"
alias cdnc="cd $HOME/programs/neovim/scripts"
alias cdnn="cd $HOME/programs/neovim/src/nvim"
alias cdns="cd $HOME/programs/neovim/src"
alias cdp="cd $HOME/programs"
alias cdv="cd $HOME/programs/vim/src"
alias cdw="cd $HOME/programs/work"
alias cdu="cd $HOME/programs/uncrustify"
alias d="cd $HOME/.dotfiles"
alias n="cd $HOME/.dotfiles/nvim/.config/nvim"
alias c="cd $HOME/.dotfiles/config/.config"
alias ds="cd $HOME/.dotfiles/shells"
alias ft="cd $HOME/.config/nvim/ftplugin"
alias bin="cd $HOME/.dotfiles/bin/.bin"

#config
alias ali="$EDITOR $HOME/.dotfiles/shell/.config/fish/conf.d/alias.fish"
alias prc="$EDITOR $HOME/.dotfiles/nvim/.config/nvim/plugin/packer.lua"
alias rc="$EDITOR $HOME/.dotfiles/shell/.config/fish/config.fish"
alias brc="$EDITOR $HOME/.bashrc"
alias frc="$EDITOR $HOME/.dotfiles/shell/.config/fish/config.fish"
alias zenv="$EDITOR $HOME/.zshenv"
alias unrc="$EDITOR $HOME/programs/neovim/src/uncrustify.cfg"
alias vimrc="$EDITOR $HOME/.config/nvim/init.lua"
alias bsprc="$EDITOR $HOME/.config/bspwm/bspwmrc"
alias sxhrc="$EDITOR $HOME/.config/sxhkd/sxhkdrc"
alias trc="$EDITOR $HOME/.tmux.conf"
alias gconf="$EDITOR $HOME/.gitconfig"

# reload current shell
alias reload="exec fish"

# Exec new shell
alias z="exec zsh -o NO_GLOBAL_RCS"
alias b="exec bash"
alias f="exec fish"

# reset
if set -q TMUX
	alias reset="clear; tmux clearhist"
else
	alias reset="tput reset"
end

# wifi
alias wifi="sudo nmtui"

## zsh-only aliases (mostly global aliases)
#if [ -n "$ZSH_VERSION" ]; then
#	alias -g A="| ack -i"
#	alias -g R="| rg -i"
#	alias -g C="| xclip -selection clipboard"
#	alias -g L="| less"
#	alias -g NE="2> /dev/null"
#	alias -g NUL="&> /dev/null"
#
#	# Remove first dollar in commands
#	alias \$=''
#fi

# Make "dangerous" operations interactive
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

alias mkdir="mkdir -p"

# xclip
alias clip="xclip -sel clip <"

## web
#fire() {
#	firefox "$1" NUL
#}
#chrome() {
#	google-chrome-stable "$1" NUL
#}

## rmdir
#alias rmd="rmdir * 2>/dev/null"

# Restore dotfiles
alias restore="git -C $HOME/.dotfiles checkout .; reload"

# Download youtube as mp3
alias yget="youtube-dl --extract-audio --audio-format mp3"

# Don't record in history.
alias vlc=" vlc"

## Screenshot
#ss() {
#	gnome-screenshot NUL -d "${1:-2}" &
#}

# Brightness
alias x="brightnessctl set"
alias x+="brightnessctl set +3%"
alias x-="brightnessctl set 3%-"
alias xmax="brightnessctl set 100%"
alias xmin="brightnessctl set 1%"

# Use make without printing the input and automatically use parallel jobs.
alias make="make -s"

## Make commands human-readable.
#alias du="du -h"
#alias df="df -h"
#alias free="free -h"

# Fast tmux
alias t="tmux"

## Print human-readable PATH and FPATH
#alias path="tr ':' '\n' <<< $PATH | sort"
#alias fpath="tr ':' '\n' <<< $FPATH | sort"

## allow sudo to expand aliases as well as run anything in $PATH
#alias sudo='sudo env PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"	'

alias logout="loginctl terminate-user dundar"

#alias hook="cd .git/hooks"

alias virtual="python -m venv .venv"

#alias ch="reset; shellcheck -x -e SC2086"
#alias chs="ch -S style"
#alias chi="ch -S info"
#alias chw="ch -S warning"
#alias che="ch -S error"

#alias q="shellcheck -f diff"

#chr() {
#	reset
#	find . -name "*.sh" -exec shellcheck -x -W 0 -e SC2086 "$@" {} \;
#}

#chra() {
#	reset
#	find . -type f -exec shellcheck -x -W 0 -e SC2086 "$@" {} \;
#}

alias fo="shfmt -w -s"

#lower() {
#	for filename in "$@"; do
#		filename_lower=$(echo $filename | tr '[:upper:]' '[:lower:]')
#		mv -n $filename $filename_lower
#	done
#}

alias rename="perl-rename -i"

alias detox="detox -s lower"

#vmprof() {
#	python -m vmprof --lines -o results.dat pre-commit
#	vmprofshow --lines results.dat | less
#	rm -f results.dat
#}

#alias ffmpeg='ffmpeg -hide_banner'
#alias ffprobe='ffprobe -hide_banner'

#mpv() {
#	command mpv ${@:-*}
#}

#mp4copy() {
#	ffmpeg -i $1 -c copy ${1%.*}.mp4
#}

#alias scc='scc --no-complexity --no-cocomo'

#nuke() {
#	if [[ $(pwd) != /home/dundar/programs/nvim-typo ]]; then
#		echo "RUNNING DANGEROUS COMMAND OUTSITE OF TESTING AREA. ABORT"
#		return 1
#	fi
#
#	while read -r branch; do
#		[[ -n $branch ]] || continue
#
#		git push origin --delete "$branch"
#	done <<<"$(git branch --remotes | grep -v "main" | grep -v "master" | grep -v "HEAD" | sed 's|origin/||')"
#
#	while read -r branch; do
#		[[ -n $branch ]] || continue
#
#		git branch -D "$branch"
#	done <<<"$(git branch | grep -v main | grep -v master)"
#}

#gooo() {
#	#nuke
#	#branch="$*"
#	#gcbb "$branch"
#	#git commit --allow-empty -m "$branch"
#	#gp
#	#gh pr create --fill
#	#gis master

#	nuke
#	branch="$*"
#	gcbb "$branch"
#	sed -i "s|$branch||g" src/nvim/highlight.c
#	git add -A
#	git commit -m "$branch"
#	git push
#	gh pr create --fill
#	gh pr edit --add-label typo
#	git switch master
#}

#build-uncrustify-current() {
#	local uncrustify_build_path="$HOME/programs/uncrustify/build"
#
#	mkdir -p $uncrustify_build_path
#
#	(
#		cd $uncrustify_build_path >/dev/null
#
#		cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release ..
#		cmake --build .
#	)
#}

#build-vim() (
#	local vim_path="$HOME/programs/vim"
#
#	cd $vim_path >/dev/null
#	touch src/**/*
#	bear -- make -j
#)

alias black="black -C"

alias cl='clang-format -i'
#alias un='uncrustify -c $HOME/programs/neovim/src/uncrustify.cfg --replace --no-backup'
#alias bun='$HOME/programs/uncrustify/build/uncrustify -c $HOME/programs/neovim/src/uncrustify.cfg --replace --no-backup'
alias un='$HOME/programs/uncrustify/build/uncrustify -c $HOME/programs/neovim/src/uncrustify.cfg --replace --no-backup'
alias clint='$HOME/programs/neovim/src/clint.py'
#alias unc-update='uncrustify -c $HOME/programs/neovim/src/uncrustify.cfg --update-config-with-doc -o $HOME/programs/neovim/src/uncrustify.cfg'
#alias bunc-update='$HOME/programs/uncrustify/build/uncrustify -c $HOME/programs/neovim/src/uncrustify.cfg --update-config-with-doc -o $HOME/programs/neovim/src/uncrustify.cfg'
alias unc-update='$HOME/programs/uncrustify/build/uncrustify -c $HOME/programs/neovim/src/uncrustify.cfg --update-config-with-doc -o $HOME/programs/neovim/src/uncrustify.cfg'

#tidy() {
#	for i in "$@"; do
#		clang-tidy --config-file "$HOME/.clang-tidy" "$i"
#	done
#}

alias codespell="codespell --config $HOME/.codespellrc"

#vs() {
#	while read -r file; do rg -iH "Maintainer:.*$@" $file; done <<<$(codespell | awk -F: '{print $1}' | sort -u)
#}

#vp1() {
#	file="$1"
#	file_basename="$(basename "$1")"
#
#	if [[ $file_basename != *.c && $file_basename != *.h ]]; then
#		return
#	fi
#
#	rm -f after.c before.c
#
#	cp -f $file after.c
#	un after.c
#
#	git uncommit
#
#	cp -f $file before.c
#	un before.c
#
#	diff -Naur before.c after.c >vim-patch
#
#	sed -i "s|before.c|a/src/nvim/$file_basename|" vim-patch
#	sed -i "s|after.c|b/src/nvim/$file_basename|" vim-patch
#
#	mv -f vim-patch $HOME/programs/neovim
#
#	(
#		cd $HOME/programs/neovim
#		patch -l -p1 -N -t --no-backup-if-mismatch <vim-patch
#	)
#}

#vp() {
#	rm -f **/*.rej *.patch
#	version="$1"
#	scripts/vim-patch.sh -p "$version"
#
#	patch -l -p1 -N -t --no-backup-if-mismatch <*.patch
#
#	(
#		cd .vim-src
#		git checkout "$version"
#
#		while read -r file; do
#			git checkout "$version"
#			vp1 "$file"
#		done <<<"$(git diff-tree --no-commit-id --name-only -r $version)"
#
#		git checkout master
#	)
#
#	rm -f vim-patch **/*.orig
#}

alias bi "$HOME/programs/neovim/bin/nvim"
alias asan "UBSAN_OPTIONS=print_stacktrace=1 ASAN_OPTIONS=log_path=/tmp/nvim_asan $HOME/programs/neovim/bin/nvim"

alias asan-log "vi /tmp/nvim_asan"

alias lt "reset; languagetool --autoDetect --disable DASH_RULE,COMMA_PARENTHESIS_WHITESPACE,ARROWS,UNLIKELY_OPENING_PUNCTUATION,WHITESPACE_RULE,FILE_EXTENSIONS_CASE,PLUS_MINUS,UPPERCASE_SENTENCE_START"

alias gen "$HOME/programs/neovim/scripts/gen_vimdoc.py"

alias diff "diff -W (tput cols)"

alias upgrade "topgrade"

alias fd "fd --hidden"
