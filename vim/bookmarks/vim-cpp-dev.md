# C/C++ development in vim

## C / C++ general tips, tags generation using ctags, simple completion plugins and snippets

* [How do I run a C program from VIM?](https://stackoverflow.com/questions/2627886/how-do-i-run-a-c-program-from-vim)
* [Configuring Vim for C++](https://stackoverflow.com/questions/4237817/configuring-vim-for-c)
* [Using Vim as C/C++ IDE](https://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/)
* [vim configuration for Linux kernel development](https://stackoverflow.com/questions/33676829/vim-configuration-for-linux-kernel-development)
* [Generating tags for C standard library](https://stackoverflow.com/questions/1632633/ctags-does-not-parse-stdio-h-properly)

### tags and omnicppcomplete

Omnicppcomplete is a simple plugin that populates the omnicomplete function for cpp files <br>
accroding to tags that generated for the project. <br>
The original version is here <https://www.vim.org/scripts/script.php?script_id=1520>. <br>
Slightly newer version (by same author) <https://github.com/FromtonRouge/OmniCppComplete>

The plugin works well for simple projects, but the completion of C++ standard library is <br>
is complicated because it is hard to generate the tags file for it. (even with universal-ctags)<br>
Here some advices how to do it: <br>
* <https://stackoverflow.com/questions/24489855/generate-ctags-for-libstdc-from-current-gcc>
* <https://vi.stackexchange.com/questions/25756/vim-omni-complete-and-c20>
* <https://docs.ctags.io/en/latest/man/ctags.1.html>
Here is my notes how I tried to do it:
```
GCC_VERSION=11.2.0
cp -R /usr/include/c++/$GCC_VERSION ~/.vim/cpp_stl_include
find ~/.vim/cpp_stl_include/ -type f | xargs sed -i 's/namespace std _GLIBCXX_VISIBILITY(default)/namespace std/'
ctags -R --kinds-c++=+p --fields=+iaS --extras=+q   \
    --language-force=C++ -I _GLIBCXX_NOEXCEPT       \
    -f ~/.vim/stdlib-tags ~/.vim/cpp_stl_include/
```
Also, with that command, it is possible to find all MACROS that are used in stdlib
```
# find all usages of _GLIBCXX_ macros, so it is possible to add them to -I flag for ctags
find ~/.vim/cpp_stl_include/ -type f -exec grep '_GLIBCXX_' {} \; | grep -v -E '^[#if|#end]' | sort -u > glibcxx.log
```
Anyway, I decided not to use tags for stdlib, but only use them for the project source itself.<br>
For this, I use gutentags plugin, that confiugured to run whet it sees `.tags` file at the root <br>
of the project. (So when I want tags file to be generated for the project, I touch .tags file)

Some more links about using gutentags and omnicppcomplete
* [C++ code completion | Vim Tips Wiki | Fandom](https://vim.fandom.com/wiki/C%2B%2B_code_completion)
* [Code completion for C++ in Vim with OmniCppComplete](https://web.archive.org/web/20160411015911/http://design.liberta.co.za/articles/code-completion-intellisense-for-cpp-in-vim-with-omnicppcomplete/)
* [how to setup tags properly with gutentags](https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/)
* <https://blogs.gnome.org/lharris/2008/07/20/code-completion-with-vim-7/>

### cpp documentation
Vim can jump to man page of the cword after pressing K.<br>
By default, the jump is to underling shell and using `man` there.<br>
There is also a possibility to use Man builtin plugin. It uses `:Man <word>` to open <br>
a window with man page inside vim. The `Ctrl-]/Ctrl-T` works to jump in/out to further man pages <br>
Another vim plugin for vim is <https://github.com/vim-utils/vim-man> which based on the builtin Man plugin
* <https://stackoverflow.com/questions/2272759/looking-up-c-documentation-inside-of-vim>

### snippets and mucomplete
* [vim-mucomplete: cpp member auto completion](https://github.com/lifepillar/vim-mucomplete/wiki/Cpp--member-auto-completion)
* An example of using mucomplete and ultisnips
<br> <https://www.reddit.com/r/vim/comments/fs93zx/using_tab_for_autocomplete_and_snippets/>

---------------------------------------------------------------
## Build systems
* dispatch plugin
* [using vim for C++ development](https://idie.ru/posts/vim-modern-cpp/)
* [dane-bulat setting up build system for c++](https://dane-bulat.medium.com/vim-setting-up-a-build-system-and-code-completion-for-c-and-c-eb263c0a19a1)
* [debugging in vim](https://www.dannyadam.com/blog/2019/05/debugging-in-vim/)
* asyncrun.vim plugin
	* [skywind3000/asyncrun.vim](https://github.com/skywind3000/asyncrun.vim)
	* [Better way for cpp dev in Vim8](https://github.com/skywind3000/asyncrun.vim/wiki/Better-way-for-C-and-Cpp-development-in-Vim-8)
	* [jdhao-vim asynchronous command run](https://jdhao.github.io/2019/12/09/vim_asynchronous_command_run/)
	* [skywind3000/asynctasks.vim](https://github.com/skywind3000/asynctasks.vim)

---------------------------------------------------------------
## Vim linting and lsp plugins

* a guide to LSP in vim
<br> <https://www.reddit.com/r/vim/comments/b33lc1/a_guide_to_lsp_auto_completion_in_vim/>
* [GitHub - xavierd/clang_complete: Vim plugin that use clang for completing C/C++ code.](https://github.com/xavierd/clang_complete)

### ccls - LSP server for C++
* Explaination about [project setup (compile-commands.json/.ccls](https://github.com/MaskRay/ccls/wiki/Project-Setup)
* Example of .ccls [config](https://stackoverflow.com/questions/63528459/configure-ccls-file-for-vim)

### dense-analysis/ale plugin
* Asyncronius lint engine. Good for linting and diagnostics using LSP
* main page <https://github.com/dense-analysis/ale>
* Dense analysis discord page: [invitation](https://discord.com/invite/5zFD6pQxDk)
* ale sends the contents of buffers to varieaty of tools for checking syntax and semantics
* autocompletion is also supported (built-in or with Deoplete)
* the use of LSP can be disabled
* many people use ale with coc, or ale with vim-lsp, or ale with vim-lsc, for the autolinting
* tip: [how to add include directories in c++](https://github.com/dense-analysis/ale/issues/1616)
* [signature of c function via ale](https://www.reddit.com/r/vim/comments/jhqzsv/signature_help_via_ale/)

### prabirshrestha/vim-lsp
* <https://github.com/prabirshrestha/vim-lsp>
* a plugin for using LSP
* from the wiki: integrating with [ccls](https://github.com/prabirshrestha/vim-lsp/wiki/Servers-ccls)
* using ccls, vim-lsp and deoplete [jhao-neovim cpp dev setup](https://jdhao.github.io/2020/11/29/neovim_cpp_dev_setup/)

### natebosch/vim-lsc
* <https://github.com/natebosch/vim-lsc>
* a plugin for using LSP
* includes light completion engine
* Article about using and configuring it [bluz71 - LSP in Vim with the LSC Plugin](https://bluz71.github.io/2019/10/16/lsp-in-vim-with-the-lsc-plugin.html)


Example of configuration:
```
You don't actually need NPM and CoC. I've been using pure-VimL vim-lsc[1] for a couple of years, and it's been serving me well. My config:

  let g:lsc_auto_map = {'Completion': 'omnifunc'}
  let g:lsc_enable_autocomplete = v:false
  let g:lsc_server_commands = {
  \  'c': {
  \    'command': 'clangd',
  \    'log_level': -1,
  \    'suppress_stderr': v:true,
  \  },
  \  'cpp': {
  \    'command': 'clangd',
  \    'log_level': -1,
  \    'suppress_stderr': v:true,
  \  },
  \}
```

This gives me code completion and other niceness.

With Vim 8.1, you don't even need a package manager, since there is one built in. Just clone the Git repo into your ~/.vim/pack/vim-lsc/start/vim-lsc/.

---------------------------------------------------------------

## Intellisence code completion in vim

### Shougo/deoplete.nvim
* Asynchronous completion framework. Supposed to be thinner than coc.nvim
* In vim needs addtional plugins to function: roxma/nvim-yarp, roxma/vim-hug-neovim-rpc.
* Needs comletion sources.
* For c++ I am using Shougo/deoplete-clangx.
* The following blog helped me partially with ale and deoplete configuration
    * <https://jdhao.github.io/2020/04/19/nvim_cpp_and_c_completion>

### CoC

#### neoclide/coc.nvim plugin
* the base plugin that enables communicating with language servers.
* main page <https://github.com/neoclide/coc.nvim/>
* plus various howto's how to use it
* <https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources>

#### coc.nvim extentions
* coc-clangd <https://github.com/clangd/coc-clangd>
* vim-lsp-cxx-highligt <https://github.com/jackguo380/vim-lsp-cxx-highlight>

#### TODO
1. install coc.nvim noramlly (or understand how file types work)
2. install default llvm packages
3. recreate the coc-settings.json file
4. coc-settings.json example (also good example for vimrc in the same dir)
    * <https://github.com/fannheyward/init.vim/blob/master/coc-settings.json>

#### Ian's website - Configure coc.nvim for C/C++ development
* shows how to set up coc with ccls
* <https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/>

#### codevion youtube channel : Setting up (Neo)vim for C++: An IDE like experience with coc!
* also uses ccls
* <https://www.youtube.com/watch?v=ViHgyApE9zM>


----------------------------------------------------------------------

## Tutorials
* <https://mjmorse.com/blog/vim-and-language-servers/>

### adembudak/VimForCppDevelopment
* a little better explanation of coc.nvim config with clangd (on debian)
* also talks about linting code formating and snippets
* <https://gist.github.com/adembudak/42a34744b5e4f5980e5f4e1c980ec859>

## related plugins

### ervandew/supertab
* <https://github.com/ervandew/supertab>

### rizsotto/Bear
* generates compilation config ("compile_commands.json") for clang
* <https://github.com/rizsotto/Bear>
* Note: looks like if I am using cmake, then Bear is not needed. It's enough to add following line to CMakeLists.txt and the compile_commands.json will be created.
```
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
```
