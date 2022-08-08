
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
