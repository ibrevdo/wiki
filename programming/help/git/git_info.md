---
order: 2

---

# Git info

===== GIT terms =====

=== commit ===
is being created after changing files/adding new files and putting them into staging area. 
A commit is a snapshot of a working directory.
All commits live in **objects **direcory

=== caret ^ ===
a parent of a commit
For example, to resotore a deleted file:
''> git checkout <deleting_commit>^ -- <deleted_file_path>''

=== remote ===
means a remote repository on other server
add a remote repository to your known remotes with:
''> git remote add <remote name> <repository url>''
origin - a default name of a remote from where a local reposity was cloned

=== branch ===
Every repository has at least one branch
master is a default branch in a repositry

''remotes/origin/HEAD -> origin/master''

''> git push <remote name> <local branch>''

See all local and remote branches
''> git branch -a''

See all known branches
''> git branch -r''

branches and tags are a pointers to a commit


=== HEAD ===
HEAD is a ref (reference) to the last commit in the currently checked-out branch
Normally, it's actually a symbolic ref to checked-out branch, because a branch itself is a ref to a commit at the tip of the branch.
In that case a content of a HEAD is something like:
''ref: refs/heads/master''

**detached HEAD **- happens when you check out something besides a local branch. Like a remote branch, a specific commit, a tag.
In that case a HEAD becomes a direct ref to a commit.
The contents of HEAD will be a SHA1 hash.

**HEAD^** means the first **parent** of the tip of the current branch.





===== GIT Howtos =====

**How to find and restore a deleted file in a Git repository?**
1. Undelete //deletedFile// if it's been deleted and the deletion has not yet been staged or committed.
''> git checkout <deletedFile>''

2. If the deletion was committed, then :
Find the last commit that affected the given path. As the file isn't in the HEAD commit, this commit must have deleted it.
''> git rev-list -n 1 HEAD -- <file_path>''
checkout the version at the commit before, using the caret (^) symbol:
''> git checkout <deleting_commit>^ -- <file_path>''

**How to find and restore a deleted file in a Git repository?**
1. All the commits which have deleted files and the files deleted;
''> git log --diff-filter=D --summary''
2. Restore the deleted file.
''> git checkout $commit~1 filename''

**How to restore all deleted files in a folder?**
If the changes were not committed yet
''> git ls-files -d | xargs git checkout --''


===== .GIT directory =====


├── HEAD
├── branches
├── config
├── description
├── hooks
│ ├── pre-commit.sample
│ ├── pre-push.sample
│ └── ...
├── info
│ └── exclude
├── objects
│ ├── info
│ └── pack
└── refs
 ├── heads
 ├── remotes
 └── tags

**HEAD**
a pointer to the tip of the branch you’re working on
ref: refs/heads/master

**config**

branches
refs/remotes/<remote>/
