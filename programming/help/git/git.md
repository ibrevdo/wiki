
# Git help


## Definitions

| Definitions       |                                                |
|-------------------|------------------------------------------------|
| working directory | directory watched by git                       |
| branch            | a pointer to commit                            |
| head              | a pointer to current branch                    |
| staging area      | all changes that are going to be committed     |
| tracked files     | new files that have been added to staging area |


## Init

| Init      |                                    |
|-----------|------------------------------------|
| git init  | Initialize git                     |
| git clone | copy git directory to new location |



## Changes
| Changes                         |                                          |
|---------------------------------|------------------------------------------|
| git add <file>                  | get file/changes on file ready to commit |
| git add -u                      | update all changes                       |
| git commit                      |                                          |
| git commit -m <commit message>  | commit staging area                      |
| git commit -am <commit message> | add everything and commit                |
| git mv <file> <new file>        | move or rename files                     |
| git rm <file>                   | remove file from git                     |


## Undo
| Undo                      |                                                                             |
|---------------------------|-----------------------------------------------------------------------------|
| git checkout -- <file>    | undo changes to file                                                        |
| git checkout <commit>     | return to commit (detached HEAD state )                                     |
| git revert <commit>       | undo changes of <commit> and apply on branch                                |
| git reset <file>          | remove file from staging area                                               |
| git reset <commit>        | move current branch tip to <commit> <BR> (but don't touch unstaged changes) |
| git reset --hard <commit> | move current branch tip to <commit> <BR> and cancel unstaged changes too    |
| git clean                 | remove untracked file                                                       |
| git clean -n              | list files that are going to be cleaned                                     |
| git clean -f              | remove untracked files                                                      |
| git clean -fd             | remove untracked files and directories                                      |
| git clean -fx             | remove untracked and ignored files                                          |
| git clean -f <path>       | remove untracked files from <path> directory                                |
| git stash                 | stash current changes                                                       |
| git stash apply           | restore the stash                                                           |
| git stash list            |                                                                             |


## Branches

| Branches                                 |                                                                   |
|------------------------------------------|-------------------------------------------------------------------|
| git branch -a                            | list branches                                                     |
| git branch <name>                        | create new branch from current branch                             |
| git checkout <branch>                    | switch to existing branch                                         |
| git checkout -b <branch>                 | create new branch and switch to it                                |
| git checkout -b <branch> <old branch>    | create new branch from old branch and switch to it                |
| git checkout -b <branch> <origin/branch> | create new branch from newly fetched branch <BR> and switch to it |
| git branch -u <origin/master>            | track current branch to origin/master                             |
| git merge <branch>                       |                                                                   |
| git difftool -d                          | see changes to last commit                                        |
| git difftool -d <branch1> <branch2>      | diff (recursive) between branches                                 |
| git lol -all                             |                                                                   |


## Remotes

| Remotes                           |                                                   |
|-----------------------------------|---------------------------------------------------|
| origin/master                     | the pointer to commit of origin (last fetch )     |
| git push                          | merge current (head) branch to server's branch    |
| git push origin new_branch        |                                                   |
| git fetch                         | update remote's branches                          |
| git pull                          | fetch + merge                                     |
| git log origin/master %%^master%% | show changes that I will get when I will do fetch |
| git log %%^master origin/master%% | show changes I am going to push to server         |


===== Configure =====
| Configure                                                             |   |
|-----------------------------------------------------------------------|---|
| git remote add origin ssh://user@192.168.0.200/home/user/gitshare     |   |
| git remote set-url origin ssh://user@192.168.0.200/home/user/gitshare |   |
| git config --global diff.tool meld                                    |   |

------------------------------------

## Links

### Git
* http://gitready.com/
* https://git-scm.com/book/en/v2
* https://try.github.io/levels/1/challenges/2
* git howto's https://klen.github.io/some-git-things.html
* https://nvie.com/posts/a-successful-git-branching-model

### Github
* github pages basic				https://help.github.com/categories/github-pages-basics/
* User, organization and Project pages		https://help.github.com/articles/user-organization-and-project-pages/
