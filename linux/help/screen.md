# Screen usage

## Initialization
* `screen -ls`                  list running screen sessions
* `screen -r <session>`         reattach to running screen
* `screen -S <session_name>`    start screen with named session
* `screen -X -S <session_name> quit` kill session without attaching to it

## Windows
* `C-a "`           present a list of all windows (choose with arrows and return)
* `C-a <num>`       go to window <num>
* `C-a C-a`         toggle between current and previous window
* `C-a S-a`         rename current window
* `C-a c`           create new window with a shell in it
* `C-a n`           jump to next window
* `C-a p`           jump to prev window
* `C-a "`           list of windows
* `C-a k`           kill window
* `C-a :number`     renumber current window
* `S-PageUp/PageDown`   scroll the screen window

## Sessions
* `C-a :sessionname`        rename session
* `C-a d`                   Detach session
* `C-a S-k`                 Kill session
* `C-a :quit`               Kill session
* `C-a C-z`                 suspend screen

## Copy/scrollback mode
* `C-a Esc`         enter a copy mode. in copy mode search with /
* `<Esc>`           Exit copy/scrollback mode
* `h,j,k,l`         move cursor like VIM
* `C-b`             page up
* `C-f`             page down
* `<Space>`         Set mark.  When the second mark is set, the text <br>
                    between the two marks will be put into screen's <br>
                    paste buffer and copy/scrollback mode will be exited.
* `^`               Move to first non-space character on current line
* `$`               Move to last non-space character on current line
* `0`               Move to leftmost column
* `c`               Set the left margin for block-mode copying
* `C`               Set the right margin for block-mode copying
* `x`               Exchange the first mark with current cursor position useful for moving an already set mark


## Regions
* `C-a S`           Split the current window into two new ones.
(The blank window will be displayed in the new
region until you use one of the window selection commands.)
* `C-a <Tab>`       Switch focus to the next region.
* `C-a :resize 25%` resize region
* `C-a x`           close region
* `C-a S-q`         close all regions but current one


## Other commands
* `C-a ?`           help
* `C-a a`           Send ("C-a") to the program running in the current window.
* `C-a ]`           Send the contents of the paste buffer to the program running in the current window.
* `C-a t`           Show time, date, hostname, and some other stuff.
* `C-a @`          Do nothing
* `C-a :`           Enter the command line mode
* `C-a :source ~/.screenrc` reloads configuration file



