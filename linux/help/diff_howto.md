
# diff howto

## example of recursive usage with diff and vimdiff
run vimdiff on all files that differ between two subdirectories

```
exclude_list="--exclude=dir_to_exclude --exclude=dir_to_exclude"
files=$(diff -rq $exclude_list dir1 dir2 | grep differ | sed "s/^Files //g; s/ differ$//g; s/ and /:/g")

for file in $files; do 
    vimdiff ${file%:*} ${file#*:}; 
done
```

## using vim dirdiff plugin as git difftool
In .gitconfig:
```
[diff]
    tool = default-difftool
[difftool "default-difftool"]
    cmd = vim -f '+next' '+execute \"DirDiff\" argv(0) argv(1)' $LOCAL $REMOTE '+syntax off'
```
Example: diffing working directrory with branch dev
```
git difftool -d dev
```
from here <https://stackoverflow.com/questions/8156493/git-vimdiff-and-dirdiff>
