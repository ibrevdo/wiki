# Vim LSP summary

Vim linting and lsp plugins
---------------------------------------------------------------
### ccls - LSP server for C++
* Explaination about [project setup (compile-commands.json/.ccls](https://github.com/MaskRay/ccls/wiki/Project-Setup)
* Example of .ccls [config](https://stackoverflow.com/questions/63528459/configure-ccls-file-for-vim)

### dense-analysis/ale plugin
* Asyncronius lint engine. Good for linting and diagnostics using LSP
* main page <https://github.com/dense-analysis/ale>
* Dense analysis discord page: [invitation](https://discord.com/invite/5zFD6pQxDk)
* ale sends the contents of buffers to varieaty of tools for checking syntax and semantics
* autocompletion is also supported (built in or with Deoplete)
* the use of LSP can be disabled
* many people use ale with coc, or ale with vim-lsp, or ale with vim-lsc, for the autolinting
* tip: [how to add include directories in c++](https://github.com/dense-analysis/ale/issues/1616)

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
* example of configuration:
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

### Shougo/deoplete.nvim
* Asynchronous completion framework. Supposed to be thinner than coc.nvim
* In vim needs addtional plugins to function: roxma/nvim-yarp, roxma/vim-hug-neovim-rpc.
* Needs comletion sources.
* For c++ I am using Shougo/deoplete-clangx.
* The following blog helped me partially with ale and deoplete configuration
    * <https://jdhao.github.io/2020/04/19/nvim_cpp_and_c_completion>

CoC
----------------------------------------------------------------------

### neoclide/coc.nvim plugin
* the base plugin that enables communicating with language servers.
* main page <https://github.com/neoclide/coc.nvim/>
* plus various howto's how to use it
* <https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources>

### coc.nvim extentions
* coc-clangd <https://github.com/clangd/coc-clangd>
* vim-lsp-cxx-highligt <https://github.com/jackguo380/vim-lsp-cxx-highlight>

### TODO
1. install coc.nvim noramlly (or understand how file types work)
2. install default llvm packages
3. recreate the coc-settings.json file
4. coc-settings.json example (also good example for vimrc in the same dir)
    * <https://github.com/fannheyward/init.vim/blob/master/coc-settings.json>

### Ian's website - Configure coc.nvim for C/C++ development
* shows how to set up coc with ccls
* <https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/>

### codevion youtube channel : Setting up (Neo)vim for C++: An IDE like experience with coc!
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
