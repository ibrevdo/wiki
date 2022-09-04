# Vim Info

---------------------------------
## Movement

Jumps commands include: searches (and repetitions), substitutions, parenthesses jumping,
paragraphs and sentences, locations inside window, opening another file

* `w`/`W`           move to start of next word/WORD (the delimeter of WORD is space)
* `b`/`B`           move back to start of previous word/WORD
* `e`/`E`           move to end of next word/WORD
* `ge`/`gE`         move back to end of previous word/WORD
* `0`/`$`           move to start/end of line
* `f<char>`/`F<ch>` move forward/back to next occurance of letter `<char>`
* `t<char>`/`T<ch>` move until next occurance of letter `<char>`
* `;`               repeat above, in same direction
* `,`               repeat above, in reverse direction
* `(`/`)`           jump to prev/next sentence
* `{`/`}`           jump to prev/next paragraph
* `[[`/`]]`         jump to prev/next code block (first column has `{`)
* `gg`/`G`          jump to start/end of file
* `H`/`M`/`L`       jump to windows top/middle/bottom
* `<C-d>`, `<C-u>`  half page down/up
* `<C-f>`, `<C-b>`  page forward, page back
* `%`               jump to matching bracket `( ), [ ], { }`. Even if the cursor is not positioned on the bracket
* `''`              jump back to line where cursor was before the latest jump
* `'.`              jump to line where was last change
* `:jumps`          see list of jumps
* `g;` `g,`         go back/forward through list of changes (`:changes` see list of changes)
* `C-i`             jump forward (in)
* `C-o`             jump back (out)
* `C-]`             jump to tag definition (works in help or with ctags)
* `C-T`             jump back from C-] jump
* `gf`              jump to file under cursor
* `gd`/`gD`         jump to definition(first occurance)/global definition of word under cursor
* `g;`/`g,`         jump backward/forward the jumplist

## Scroll

|     |                                                             |
|-----|-------------------------------------------------------------|
| zz  | scroll the line with the cursor to the center of the screen |
| zt  | scroll the line with the cursor to the top                  |
| zb  | scroll the line with the cursor to the bottom               |
| C-y | scroll up                                                   |
| C-e | scroll down                                                 |

## Operations
* `i`           enter insert mode before cursor pos
* `a`           enter insert mode after cursor pos
* `I`           enter insert mode at the start of the line
* `A`           enter insert mode at the end of the line
* `o`,`O`       enter new line after/before current and stay in insert mode
* `x`,`X`       delete single character at/before cursor position
* `r`           replace single character at cursor position
* `R`           enter replace mode
* `["x]d{motion}`   delete from cursor pos till the "motion" [put deleted text into register x]
* examples:
    * `dw`      delete till the start of next word
    * `dt}`     delete till next occurance of }
    * `dd`      delete whole line
    * `D`       delete from cursor pos till end of line
* `["x]c{motion}`   change from cursor pos till the "motion" [put deleted text into register x]. (like delete but stay in insert mode)
* `["x]y{motion}`   yank (copy) from cursor pos till the "motion" [put yanked text into register x]
* `["x]p`,`["x]P`   paste yanked/deleted text after/before the cursor pos [take a text from register x]


## Searching

|         |                                                                       |
| ------- | --------------------------------------------------------------------- |
| `*`     | find (and highlight) exact word under cursor (forward)                |
| `#`     | find (and highlight) exact word under cursor (backwards)              |
| `g*`    | find (and highlight) partial word under cursor (forward)              |
| `g#`    | find (and highlight) partial word under cursor (backwards)            |
| `/text` | find text (forward)                                                   |
| `?text` | find text (backward)                                                  |
| `n`     | next matching search pattern                                          |
| `N`     | previous matching search pattern                                      |

## Marks

```
|               |                                                              |
| ------------- | ---------------------------------------------------------    |
| Auto marks    |                                                              |
| ``            | last jump (cursor pos) within current file                   |
| `.            | last edit (cursor pos) within current file                   |
| `0            | jump to position in last file edited (after exiting vim)     |
| `[ `]         | start/end of last changed or yanked text                     |
| `< `>         | start/end of last visual selelction                          |
| 'a            | go to line of mark a                                         |
| `a            | go to cursor position of mark a                              |
| Local marks   |                                                              |
| ma            | put current postion in mark a                                |
| Global marks  | Global marks use capital letters and are saved between files |
| mA            | set global mark by m and capital letter                      |
```

## Registers
* The command that can use a register looks like this : `"{register}command`.
* For example, to a yank a current word into register 'a' run : `"ayiw`
* To yank a selected word into register b: 1) select a word 2) `"by`
* To paste from register a: `"ap`
* To paste from a default register while in insert mode: `<C-r>"`
* To copy one register to another : `let @b=@a`

|              |                                                                            |
| --------     | -------------------------------------------------------------------------- |
| `""`         | unnamed (default) register. contains what was deleted/yanked.              |
|              | Commands `x`,`s`,`c{motion}`,`d{motion}` all set content of this register  |
| `"0`         | yank register. command `y{motion}` sets this register                      |
| `"0p`        | paste from yank register                                                   |
| `:reg`       | inspect registers                                                          |
| `"a`         | named register a                                                           |
| `"/`         | last search register                                                       |
| `":`         | last Ex command                                                            |
| `"%`         | name of current file                                                       |
| `<C-r>`      | Use register in insert mode/command mode                                   |
| `<C-r><C-w>` | Put word under cursor in command mode                                      |

## Macros

* `qa`      Start recording macro into register a. Stop recroding with `q`.
* `@a`      play macro stored in register a
* `@@`      repeat last executed macro
* `22@a`    execute macro on next 22 buffers (num of buffers can be less than 22)
* `:%norm! @a`  To repeat macro stored in register 'a', on whole file:

## Insert mode
* `C-a` paste last inserted text
* `C-o` execute single normal mode command
* `C-[` go to normal mode
* `C-w` delete word before the cursor
* `C-u` delete current line
* `C-r` paste from register
*   `C-r "` insert the last yank/delete
*   `C-r %` insert file name
*   `C-r /` insert last search item
*   `C-r :` insert last command
* `C-x C-y` scroll up
* `C-x C-e` scroll down

## Insert completion mode
* This is a sub mode of insert mode. You can enter it by typing `C-x` and one of `C-x` commands while in insert mode.
* While in completion mode, use `C-n`/`C-p` to choose next/previous sugestion.
* When completion is active you can use `C-y` to accept currently selected entry.
* Or you can use `C-e` to end the completion and go back to original text.
* `C-n`/`C-p` "complete any word" complete keyword under cursor according to `complete` option.
    * `.,w,b,u,t,i` complete order: current buffer, open windows, loaded buffers, tags, included files
* `C-x C-u` "user defined completion" complete according to a function specified in `completefunc` option
* `C-x C-f` complete a filename (the filenames are searched according to `path` option)
* `C-x C-]` complete from tags
* `C-x C-o` "omni completion" complete according to a function specified in `omnifunc` option
    * `C` requires a tags file. Example: `% ctags -R -f ~/.vim/systags /usr/include`
    * add the file to `tags` option: `set tags+=~/.vim/systags`
    * When omni completion is used after "." or "->", it attempts to recognize the type of variable and suggest only valid members.
* `C-x C-l` complete whole lines
* `C-x C-n` complete word from current buffer (search next)
* `C-x C-p` complete word from current buffer (search previous)
* `C-x C-i` complete from included files (the files are search according to `path` option
* `C-x C-d` complete definitions and macros. from included files (the files are search according to `path` option
* `C-x C-k` complete from dictionary. Uses a list of words from `dictionary` option
* `C-x C-s` complete with spelling suggestion (Possible to use `C-x s` because `C-s` suspends display in many terminals. Use `C-q` to unsuspend)


## Windows

All window commands can be activated with `<C-w><C-<letter>>` or just `<C-w<letter>>`

* `:sp <file>`      split and load file into new window
* `:sb #`           split other buffer to window
* `:new`,`:vnew`    split and open new buffer
* `:close`,`C-wq`,`:q`  close current window
* `:only`,`C-wo`    close other windows
* `C-ws`            split current window vertically
* `C-wf`            edit file under cursor in a split window
* `C-ww`            go to window below/right of current one
* `C-w<arrow>`      go to window according to direction
* `C-wp`            go to previous window
* `C-wq`            close current window
* `C-w+` `C-w-`     increase/decrease current window
* `C-w>` `C-w<`     increase/decrease width
* `C-w_`            set current window height to maximum
* `C-|`             set current window width to maximum
* `C-w=`            make all windows even size
* `C-w K/J/H/L`     move current window to top/bottom/left/right
* `C-wr`            rotate windows locations
* `C-wx`            exchange locations of two neighbor windows
* `C-wz`            close preview window

## Visual mode
* `o`   - move to other end of marked area
* `gv`  reselect last visual selection
* highlight text objects
    1. `vi}`    highlight inner {} block
    2. `va)`    highlight outer () block

## Command-line mode
* `C-b` begining of command line
* `C-e` end of command line
* `C-w` delete the word before cursor
* `C-u` delete everything between cursor and begining of line
* `C-a` complete all matches in command line
* `C-v` enter special character. For example: pressing C-x results ^X. Is used when editing macros stored in registers
* `q:` `:<C-f>` open buffer of command line
* `q/`/`q?` open cmdline for search/backward
* `C-c` exit the window
* `@:`  repeate last Ex command
* `C-r"` put yanked/deleted text into command line
* `C-r/` put last search into command line

## Sessions
* `:mksession ~/.vim/sessions/mysession.vim`    create a session
* `:source ~/.vim/sessions/mysession.vim`       load a session
* `vim -S`              start vim with last saved session
* `set ssop-=options`   do not store global and local values in a session
* `set ssop-=folds`     do not store folds in a session
* `vim-obsession` plugin will update current session automatically.
    * `:Obsession`  start updating a session
    * `vim -S`      start vim with a preloaded session

----------------------------------

## General commands
* `<C-l>`   redraw screen
* `<C-g>`   Shows filename, current line number, total lines in file, and % of file location
* `<S-r>`   Enter REPLACE mode
* `<S-q>`   Enter Ex mode
* `=G`      indent till end of file
* `J`       join a line bellow to current line
* `gJ`      join a line bellow to current line (without space)
* `gv`      reselect last visual selection
* `g;`,`g,` jump to previous (next) editing position
* `gi`      jump to previous editing position and enter insert mode


## Arglist

* `:args`           show arglist
* populate args with shell command

```sh
    :args `find *.md`
```
* `:next`/`:prev`   traverse trough buffers inside arglsist
* `:first`/`:last`  jump to first/last buffer of arglist
* `:argdo %s/\a/*/ge` execute substitude command on every file in arglist
* `:argdo edit!`    undo last change in all buffers in arglist
* `:argdo update`    save changes in all buffers in arglist
* `:argdo normal @a` execute macro on every file in arg list

## Quickfix list

* `:copen`,`:close` open/close quickfix window
* `:ccl`            close quickfix window
* `:cw`             open if there are results / close it otherwise
* `:cc [nr]`        go to result number (go to same result if number omitted)
* `:cp`,`[q`        show prev entry of quickfix list
* `:cn`,`]q`        show next entry of quickfix list
* `:cfirst`,`[Q`    show first entry of quickfix list
* `:clast`,`]Q`     show last entry of quickfix list

## Tags
* `C-]`             jump to tag definition
* `C-w]`            open tag definition in split windiw
* `C-w }`           open tag definition in preview window
* `pc`              preview close
* `C-wz`            preview close
* `g]`              open a window of defintions of current tag
* `tj <expr>`       open a window of definitions of tag `<expr>`
* `ptj <expr>`      open a preview window for tag `<expr>`. Use `ptn`, `ptp` to navigate
* `:tag /<expr>`    search for tag

## Finding file
`edit` and `find` commands are used to find and open an paritcular file.

* `:e[dit]`  command to open files relatively to working directory.
            Supports globs use. Example:
* `:e **/*time<Tab>`   find recursively file with partial name "time" and open it
* `:fin[d]` command is used to open files relatively to `path` locations.
* `:set path?`  to inspect current path locations
* if `**` is added to path, then is is possible to use find like that:
* `:fin *time<Tab>` to search for partial name recursively

## Folding

* `zf{moion}`       create fold
* `zfa{`            create fold of a paragraph between curly braces ( a function block)
* `zd`              fold delete
* `zE`              folds eliminate (delete all folds in the document)
* `zo`/`zc`         open/close current fold
* `zO`/`zC`         open/close current and nested folds
* `za`              toggle open/close for current fold
* `zA`              toggle open/close for current and nested folds
* `zr`              reveal all folds one level
* `zR`              reveal all folds completely
* `zm`              fold more on all folds
* `zM`              fold completely all folds
* `zn`              folds none (open all folds in file)
* `zN`              folds normal (return prevoius folding)
* `zi`              switch folding on/off
* `zv`              expand folds to reveal cursor
* `[z`,`]z`         go to start/end of current fold
* `zj`,`zk`         go to next/previous fold
* `:mkview`         save created folds
* `:loadview`       load previously created folds

## Vimdiff

Open two windows with two buffers (each buffer may be unnamed)

* `:windo diffthis` start diff on two windows
* `:windo diffoff`  stop diff
* `[c`,`]c`     jump back and forward between changes
* `:diffget`,`:diffput` resolve differences between files
* `:diffupdate` rescan changes

## Clipboard
* In Linux (X11) there two types of clipboards:
    * Selection (`"*`) - populated by selection. Paste with middle mouse.
    * Clipboard (`"+`) - populated with CTRL-C. Paste with CTRL-V or right mouse option.
    * In Windows only clipboard exists, so both registers have same values
* In order to use the registers Vim needs to have `+clipboard` enabled (check it with `:echo has('clipboard')`.
    * 'clipboard' is usually enabled in gvim (vim-gtk in Ubuntu) and not enabled in terminal vim
    * `"+y` puts visual selection from Vim into system clipboard (paste it with CTRL-V)
    * `"+p` puts CTR-C text from system into Vim
* Otherwise you can use terminal copy/paste capability:
    * In order to copy to clipboard from vim hold "Shift" while selecting with mouse. Now paste qith middle button
    * In order to paste form clipboard into vim use "shift+middle click" or "Shift+Insert"

--------------------------------
## Search, substitute and vim regex

Search with `/<expr>`, substitute with `range s/pattern/string/cgiIe`. \\
Where c-confirm, g-all occurances in range, i-ignore case, I-don't ignore case, e-don't show errors
It is possible to use any character instead of `/` as a separator.

* `\<`,`\>` Anchors for start and end of a word. Example: `/\<i\>` search for a word i
* `^`, `$`  Anchors for begining and end of a line.
* `.`       any character except a new line
* `\s`,`\d`,`\w`,`\a` Space character, digit, word, alphabetic
* `\S`,`\D`,`\W`,`\A` Non-Space character, Non-digit, Non-word, Non-alphabetic
* `*`           matches 0 or more characters. `.*` matches everything.
* `\+`          matches 1 or more.
* `\=`          matches 0 or 1
* `{n}`,`{,m}`,`{n,}`,`{n,m}` matches exactly n, 0 to m, at least n, from n to m.
* `[012345]`    character range will match any of characters inside
* `[^A-Z]`      Negation sign `^` will match any character which is not in a range
* `\(`, `\)`     group part of pattern and refer to them inside replacement pattern by their
                number `\1`,`\2`,`\3`
* `\|`      Find this or that. The first match will be used. Not greedy. (so order is important)
* Examples:
    * `:s//str/`    use a prevoius expression again
    * `:%s:^vi$:VIM:g` Substitute all lines in a file that contain vi to VIM.
    * `/\.\s+[a-z]` Find all places where new sentence doesn't start with capital letter.
                a period followed by one or more blanks and a lowercase letter
    * `:%s:\([.!?]\)\s\+\([a-z]\):\1  \u\2:g` Correct the prevoius example.
                                         Insert two spaces exactly between sentences.
    * `\(Date:\|Subject:\|From:\)\(\s.*\)`  Parse various mail headings and their contents into
                                        `\1` and `\2`.
* Useful mappings for substitutions

```sh
noremap ;; :%s:::gc<Left><Left><Left>
cmap    ;\ \(\)<Left><Left>
```

### Global command

`:range g!/patern/cmd` Execute the Ex command (default: `:p`) on the lines within range
where pattern matches. (or, if `!` is used, only where match does not occure) \\
If range is not specified then operate on whole file

* `:g/^$/ d`    delete all empty lines in a file
* `:g/^$/,/./-j` reduce multiple blank lines to a single blank
* `:g/^Error/ . w >> errors.txt` Find all lines starting with error and append them to errors.txt
* `:g/ml/s/:e/:sp/` substitute `:e` with `:sp` for each line that contains "ml"
* `:g//cmd`     use previous expression again

### vimgrep

vimgrep - use it to search in small group of files (like a local project)

* `:vim[grep][!] /{pattern}/[g][j] {file} ...`  Full command (possible to use shell commands to populate files list. g-every match is added. j-dont jump on first match
* `:vim /expr/ %`       Search in current file
* `:vim /expr/ *`       Search in all files in current dir
* `:vim /expr/ *.cpp`   Search in multiple cpp files in current dir
* `:vim /expr/ **`      Search recursivly in all files (under the path)
* `:vim /expr/ **/*.h`    Search recursivly in all header files
* `:vim /expr/ ##`      search inside files in arglist

search for last pattern
* press `*` on a word (will enter it to last search)
* Use empty pattern `:vim // **` to search it in all files recursively

search for all lines containing "dostuff()" in all .c files

* `:vim /dostuff()/j ../**/*.c`

search inside hidden files

* `:vimgrep /pattern/ ./.*`

### grep

grep - use on large amounts of files

* Search in all files in current dir : `:grep /expr/ *`
* Or search recursivly : `:grep -R /expr/ *`
* `:grep -R pattern *.c`
* `map <F3> :execute " grep -srnw --binary-files=without-match --exclude-dir=.git --exclude-from=exclude.list . -e " . expand("<cword>") . " " <bar> cwindow<CR>`
* you can fill file exclude.list with file patterns to exclude from search, such as `*~` – all files ending in a '~' character

"grep" and "vimgrep" fill the "quickfix list", which can be opened with :cw or :copen, and is a list shared between ALL windows.


-----------------------------------
## netrw commands
* `:e .`    go to file system view of current directory
* `:Vex`    open explorer verticaly
* `o`       open file in a split
* `p`       preview file. (open in split)
* `S-p`     open file in previous window
* `-`       go up one directory
* `%`       create a new file
* `d`       make a directory
* `<del>`   remove file/directory
* `S-d`     remove direcory
* `s`       select sorting style
* `i`       toggle files details/structure views
* `I`       toggle help view
* `gh`      show/hide dot files
* `mb`      bookmark current dir
* `gb`      go to previously bookmarked directory
* `u`       change to recently visited directory

## vim-unimpaired shortcuts
* `[q` / `]q`   navigate up and down through the quickfix list
* `[l` / `]l`   navigate up and down through the location list
* `[a` / `]a`   navigate backward and forward through the the files(args) list
* `[b` / `]b`   navigate backward and forward through the the buffers list
* `[f` / `]f`   go to the next/previous alphabetically file in current file's directory
* `[<Space>` / `]<Space>`   add a blank line above or below the current line
* `[e` / `]e`   exchage the current line, or visual lines, up or down
* `[p` / `]p`   linewise paste above or below the current line

## vim-commentary shortcuts
* `gc`      comment target of motion (or range in visual selection)
* `gcc`     comment one line

## vim-surround shortcuts
* `ysiw'`   surround inner word with single quote '
* `yss"`    surround a line with "
* `cs'"`    change surrounding ' to "
* `ds'`     delete surrounding '
* `VS`      visual highlight and surround with a tag.
* `cst`     change surrounding tag
* `dst`     delete surrounding tag
-----------------------------------

## Useful settings
* set ft=xml

## Tips

* `enew`,`new`,`vnew`    open a new unnamed buffer (current window, split horisontally, split vertically)
* `gd`      jump to first occurance of a word under cursor
* `gn`      go to next search result and visual highlight it
* `g//`     list last search occurances in current file
* `gu`/`gU` everything to lowercase/uppercase
* switch between two chars: cursor on the first one, and then `xp`
* switch between two lines: cursor of first one, and then `ddp`
* `v$r*`    replace till end of line with `*`
* `i`   Operator 'i' works to operate on inner block.
    * `yiw` copy inner word (block=word)
    * `di"` delete in quotes (block in between quotes)
    * `ci{` change in curly braces (block is between curly braces)
    * `dip` delete in paragraph (lines together)
    * `cit` change inside tags (for example html tags)
    * `>iB` indent inner block
    * `=ip` auto-indent all lines in inner paragraph
* `a`       Operator 'a' can do the same but operates on 'outer' block
* `]p`      Paste and auto-indent
* `:9t.`    copy line 9 to cursor position
* `:so %`   treat temp file as vimrc, source it so configuration become active
* `:r!ls`   Add output of shell command into current buffer
* `:%!ls`   Fill current buffer with output of the shell command
* `:.!seq 0 255 | printf '\%02x' | fmt -w 50`   put a result of compex command instead of current line
* `:w !bash`    run lines of cuurent buffer on external command (bash)
* `!./%`    execute current buffer with shell (a buffer must be saved as a file and set as executable)
* `!!`      repeate the last shell command
* `.!!`     write the result of last shell command in current line
* Comment multiple lines
    1. Position a cursor at start of line where comment required
    2. `C-v` to enter to visual block and go down as needed
    3. `I` to enter insert mode, enter the comment `#` and ESC to normal mode
    4. to uncomment, do the same but instead entering insert mode, just press `x` to remove comments
* Delete blank lines
    * `g/^$/d`
    * `:g`  will execute a command on lines which match a regex.
            The regex is 'blank line' and the command is `:d` (delete)
* Delete all buffers except current
    * `:%bd|e#` %bd = delete all buffers. e# = open the last buffer for editing.
    * `command! BufOnly silent! execute "%bd|e#|bd#"`
* Save file as a root
    * `w !sudo tee % > /dev/null`   put a content of current buffer into `%` (current file) using sudo
* Find and replace in project wide
    1. Put all files of the project in arglist `:args *.cpp`
    2. Find all reqiured changes in the project `:vimgrep /expr/g ##`
    3. Qargs command puts all files from quicklist into arglist
    4. Substitude in all files `argdo %s/expr/str/ge`
    5. Save all files `:argdo w`
* Switch between .c and .h file
    * switch from header to c : `:e %:r.cpp` and vice versa `:e %:r.h`
    * `map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>`
* Vim Terminal
    * `:bo term`    open in the bottom of all windows
    * `ctrl-w N`    switch to readonly mode (normal). useful for navigating or copy content to clipboard
    * `i` or `a`    go back to insert mode
    * `ctrl-w :`    open vim command mode
    * `ctrl-w ""`   paste from default register
