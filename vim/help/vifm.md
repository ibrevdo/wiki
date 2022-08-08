# Short vifm tutorial
Based on <https://jenyay.net/Programming/Vifm1>

### dual panel manager
* to move from side to side use <TAB>, <Space> or vim window commands
* to use only one panel, run `:only`
* use `:split` or `:vsplit` to organize windows horizontally or vertically

### copy, rename or move files
* these actions are done through using registers that hold the filenames.
* for example, `yy` , <TAB> and `p` will copy the file to other window (using unnamed register)
* to rename a file, use `cc` or `cw` (or `cW` to rename without extension)
* to delete a file, use `dd`
* to undo action use `u`, and C-r for a redo action

### multiple selection
* use `t` to select (toggle) one file
* or `v` to select multiple files, with pressing enter the selection stays
* now commands of copy, rename or move will be used on selected files

### trash bin
* `:lstrash` shows the contents of trash bin
* in order to restore file, press `r` in trash view
* longer way:
	1. `:trashes` to see all trash bins, press enter to choose one of them, 
	2. `:restore` to restore the file
* `:empty` to empty the trash bin

### configuration
* use `:set` command to view current config, or to set/unset specfic options
* for example, `:set dotfiles` to show hidden files

### view files options
* `:sort` command will open a chooser for sorting criteria
* `:set lsview` to view simple list of files (like ls)
	* `:set lsoptions=transposed` to view files in from up to down order while in lsview
	* `:set nolsview` to go back to usual file view
* `:tree` to show files and tree view. Enter will stop this view
* `:view` to preview file/dir on opposite panel

### search (and replace)
* like in vim, use `/<regexpr>` to search in visible filelist
* use `:s/<regexpr>/string/ilg to rename files

### filter the files view
* `=<regexpr>`, for example, `=zip` will show only zip files
* to undo the filtered view, press `=` (or press enter to go to another directory)
* `:filter <regexpr>` to filter filenames that contain the pattern from the view.
* `:filter` to deactivate the filtering. `:invert` to invert the filter effect
* filter commad is effective till it deactivateted

### running programs from vifm
* use ! to run a command, without showing the output, example: `:! ls /usr/bin > tmp.out`
* use !! to run a command, but keep output till enter press
* vifm parameters that can be used while working with external commands:
	* `%c` current file on which cursor is on
	* `%C` current file from another panel
	* `%f` selected files
	* `%F` selected files from another panel
	* `%d` full path to current directory
	* `%D` full path to directory from another panel
* `:shell` to spawn a shell under vifm. exit it with Ctrl-D
	
### notes and examples
* `cd d` to swith directories between the panels
* `:!gedit %c &` open current file for editing in gedit, but enable the usage of vifm
* `:jobs` to show spawned processes by vifm
* in this view, use `dd` to stop the child process


### marks and bookmarks
* `ma` to save path to current file in mark a
* `:marks` view current marks.
* `'a` go to a file marked a
* `:bmark <tag>` a bookmark with a tag for current folder
* `:bmarks` show bookmarks, and use Enter to go to one of the folders
* same tag can be used on multiple bookmarks. a bookmark can have more than one tag
* `:bmark <tag>` to show a list of bookmarks that have this tag
