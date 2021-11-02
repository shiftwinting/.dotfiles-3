function gbdd -w "git branch --delete" -a "branch"
	git push origin --delete $branch
	git branch -D $branch
end
