# REVERT A BAD COMMIT
# not pushed [local]
git reset --soft HEAD^

# pushed
git revert <commit-hash> # check commit hash with `git log`

# CHECK VARIOUS THINGS

# commit hash, author, date and message
git log

# check whether branch is up-to-date + files to be committed 
git status

# remote name and link
git remote -v
