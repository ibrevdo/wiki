
# tmux usage
All tmux commands can be run from inside tmux either by using prefix `C-b` and `:<command>`
or by just typing in the shell `tmux command`!

---------------------------------
## Sessions
* `tmux`                            start a new session
* `tmux new -s session_name`        start a new session named "session_name"
* `tmux attach -t session_name`     attach to session "session_name"
* `tmux ls`                         list sessions
* `C-b d`                           detach current session
* `tmux kill-session -t name`       kill session by name
* `tmux kill-session -a`            kill other sessions
* `tmux kill-server`                kill all tmux sessions

## Windows (tabs)
* `C-b c`                   create a new window
* `C-b :rename-window name` rename the current window
* `C-b ,`                   rename the current window
* `C-b w`                   list windows
* `C-b 0-9`                 jump to window index
* `C-b l`                   jump back to last window
* `C-b n`                   go to next window
* `C-b p`                   go to previous window
* `C-b :swap-window -t <num>` swaps current window with window num
* `C-b :move-window -t <num>` assigns a number to curent window (if not taken)

## Panes
* `C-b "` `split window`    split window vertically
* `C-b %` `split window -t` split window horizontally
* `C-b x`                   kill current pane
* `C-b !`                   kill other panes
* `C-b o`                   switch to other pane
* `C-b {`                   swap current pane with previous
* `C-b }`                   swap current pane with next
* `C-b z`                   zoom/unzoom current pane

## Help
* `C-b ?`                   see bindings
* In order to copy/paste to/from system clipbaord, press SHIFT while doing it

## Configuration (in ~/.tmux.conf)
* `tmux source-file .tmux.conf`     reload configuration file
* `set -g default-terminal "xterm"`
* `set-option -g mouse on`
* `:set-window-option -g window-status-current-style bg=blue`
* in `.bahsrc` add following alias so colorscheme of vim will preserve
  * `alias tmux="TERM=screen-256color-bce tmux"`
