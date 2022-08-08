# Vim tutorial

## General definitions
* buffer - a file opened by vim
* window - a viewport on buffer
* tab - collection of windows

## Mappings
* cmap handles command-line mappings.
* imap handles insert-only mappings.
* map maps keys in normal, visual, and operator-pending mode.
* map! maps keys in Vim's command and insert modes.
* nmap maps keys in normal mode only.
* omap maps keys in operator-pending mode only.
* vmap maps keys in visual mode only.


## Other


| Ranges|                           |
|-------|---------------------------|
| .     | current line              |
| 21    | line 21                   |
| 21,25 | lines 21 to 25 inclusive  |
| $     | last line                 |
| .,$   | current line to end       |
| %     | all lines                 |



## Filename modifiers

Filename modifiers can be used after "%, "#, ...

* :p        full path
* :t        tail (last word)
* :h		head


## Options

Options are a way to control Vim.
Option's values can be boolean, numbers or strings

Change option with `set` command.

| set examples              |                                                   |
|---------------------------|---------------------------------------------------|
| :set number?              | Check current value of option                     |
| :set number               | Set boolean option                                |
| :set nonumber             | Unset boolean option by adding "no" to it's name  |
| :set number!              | Toggle previos value of boolean option            |
| :set <name>#<value>       | Set non-boolean option                            |
| :set number numberwidth#6 | You can set more than one option in the same line |

You can add to existing option
|:set tags+#./tags;/ | vim will search for tags file till root fs |

| Common options    |                                                                                                                      |
|-------------------|----------------------------------------------------------------------------------------------------------------------|
| tabstop#4 (or #8) | how many columns a tab counts for.This is the only command here that will affect how existing text displays.         |
| shiftwidth#4      | controls how many columns text is indented with the reindent operations (<< and >>)                                  |
| softtabstop#4     | controls how many columns vim uses when you hit Tab in insert mode                                                   |
| expandtab         | hitting Tab in insert mode will produce the appropriate number of spaces                                             |
| autoindent        | The indent of the new line will match that of the previous line.                                                     |
| ignorecase        | Ignore case in search patterns.  Also used when searching in the tags file.                                          |
| smartcase         | Override the 'ignorecase' option if the search pattern contains upper case characters.                               |
| smarttab          | Use the "shiftwidth" setting for inserting <TAB>s instead of the "tabstop" setting, when at the beginning of a line. |

` Some people like to keep their tabstop#8 for compatability when loading files, 
but setting shiftwidth#4 for nicer coding style.` 
  

## Commands

| Filetype                  |                                                                        |
|---------------------------|------------------------------------------------------------------------|
| filetype [on/off]         | filetype command enables file type detection.                          |
| filetype plugin [on/off]  | after detecting the filetype, vim can run an appropriate  plugin       |
| filetype indent [on/off]  | after detecting the filetype, vim can load  an appropriate indent file |
| filetype plugin indent on | means: filetype on, filetype plugin on, filetype indent on             |

`filetype on` will trigger the FileType event,which can be used to set the syntax highlighting, set options, etc.

### Syntax

## Mappings

| Common mappings               |                                                   |
|-------------------------------|---------------------------------------------------|
| nnoremap gb :ls<CR>:b<Space>  | lists all loaded buffers and populates the prompt |
| nnoremap <C-L> :nohl<CR><C-L> | cancel search highlighting and redraw             |


## Vimscript
### Functions

* expand("string")      expands meaning of string



