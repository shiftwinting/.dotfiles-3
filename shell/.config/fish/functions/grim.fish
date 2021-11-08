function grim
	set current_branch (git branch --show-current)
	set ancestor (git merge-base "$current_branch" master)
	git rebase -i $ancestor
end
