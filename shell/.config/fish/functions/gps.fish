function gps
	set current_branch (git rev-parse --abbrev-ref HEAD)
	git push --set-upstream origin "$current_branch"
end
