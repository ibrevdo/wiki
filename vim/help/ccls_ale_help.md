# ccls and ale help

## ccls help
The compilation database file (`compile_commands.json`) and `.ccls` file can be used.
The option `compilationDatabaseDirectory` can point to the location of `compile_commands.md`

### .ccls file
specifies compiler flags needed to properly index the code: `-I`,`-D` ..
a line may optionally start with one or more % directives:
* `%compile_commands.json`  append the arguments to the compiler flags for files in `compile_commands`
* `%c / %cpp / %objective-c / %objective-cpp`
* `%cu`
* `%h / %hpp`
    This argumnet should be added only when indexing C / C++ headers
    You may add these lines to make every *.h parsed as C++:
```
%h -x
%h c++-header
```

### .ccls examples
Example A
```
clang
%c -std=c11
%cpp -std=c++2a
%h %hpp --include=Global.h
-Iinc
-DMACRO
```
header files will parsed with extra --include=Global.h

Example B
```
%compile_commands.json
%c -std=c11
%cpp -std=c++14
%c %cpp -pthread
%h %hpp --include=Global.h
-Iinc
```
It appends flags so `clang` should not be used

## ale settings help
```
let g:airline#extensions#ale#enabled = 1

let g:ale_echo_msg_format='[%linter%][%severity%]%(code):% %s'
" The message displayed in the location list
let g:ale_loclist_msg_format='[%linter%]%(code):% %s'

let g:ale_linters_explicit = 1
let g:ale_linters = { 'cpp ['clang', 'g++'], 'c': ['clang']  }


" C/C++ settings {{{
""""""""""""""""
" More warnings and the usual version in flags for Clang
let g:ale_c_clang_options = '-Wall -O2 -std=c99'
let g:ale_cpp_clang_options = '-Wall -O2 -std=c++1z'

" More warnings and the usual version in flags for GCC
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++1z'

let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_cpp_clangtidy_options = '-Wall -std=c++11 -x c++'
let g:ale_cpp_clangcheck_options = '-- -Wall -std=c++11 -x c++'

""""""""""""""" run manually
" clang-check file.cxx -- -Wall -std=c++11 -x c++
" clang-tidy file.cxx -- -Wall -std=c++11 -x c++
" }}}
```
