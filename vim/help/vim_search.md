
# Vim find and replace

## FZF and RipGrep usage

### fzf in command line
```
fuzzy search application. updates search results intercatively in real time
can be installed separately or as part of vim plugin
Usually works together with search engine (like grep, find or rip grep)
The search command for fzf need to be configured in .bashrc
```
* `fzf term`  search for files (using the default command. as listed in $FZF_DEFAULT_COMMAND)
    * `fzf -e term` or `fzf 'term'` serch for exac word
    * globs are not supported. but spaces and regular expression are supported.
    * `fzf -m` Use <TAB> in order to select multiple entries of fzf search. <BR>
        Example: `fzf -m | xargs ls -l`
* `C-r`                             find command in history
* `C-t`                             find file with fzf and paste it to cli
* `vim ~/path/to/dir/** <TAB>`      find file under path (recursively) and open it in vim
* `cd ~/path/to/dir/** <TAB>`       use fzf to find right directory and to cd into it
* `ssh ** <TAB>`                    connect to recently used ssh servers
* `kill -9 <TAB>`                   find applications to kill by pid

### fd
* fzf can use `fd` as file finder command. (instead of 'find')

### bat
* fzf can use `bat` as file previewer (instead of cat 'utility')
    * it is more relevant when using fzf from vim

### ripgrep
* A cli tool for fast greping. Installed from repositories

### junegunn/fzf.vim
* the vim plugin that is a frontend for fzf
* the main commands are: Files, Buffers, Lines
* The commands are:
    * C-x open selected file in split
    * C-x open selected file in vertical split
