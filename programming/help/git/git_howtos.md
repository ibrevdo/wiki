# GIT howtos

## Common tasks

1. Create new branch from existing + changes
    * `git checkout -b <new_branch>`
2. Push new branch to remote and track it
    * `git push -u origin <new_branch>`
3. Take new updates from master to current branch
    * `git merge master`
4. undo last commit
    * `git reset --hard HEAD~1`
5. ignore local commits
    * `git reset --hard origin/<branch>`
6. how to tag versions
    * `git tag <tagname>`		creates a tag on local branch
    * `git push origin --tags`	pushes tag to remote branch
7. stash
    * `git stash`
    * `git stash pop`

## How to create a bare remote repo
```
git init --bare ~/laptopgit/myproject.git
cd /path/to/existing/repo
git remote add laptopgit ~/laptopgit/myproject.git
git push -u laptopgit master
```

## How to switch to laptopgit remote repo

1. add the laptopgit repo to a list of remotes (do it once only)
```
git remote add laptopgit ssh://127.0.0.1/home/user/laptopgit/myproject.git
git fetch --all
```
2. make local master branch track another upstream branch
```
git branch -u laptopgit/master
```
3. and back to remote origin
```
git branch -u origin/master
```
