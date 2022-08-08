
# Neovim lua plugins

### lua plugins for neovim

* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
* a file explorer witten in lua [kyazdani42/nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
* a completion engine for nvim [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* snippet engine only [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip/)
* a source for nvim-cmp [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
* a collection of snippets [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
* [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
* [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
    * [lspconfig wiki about autocompletion](https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion)
* interesting summary about nvim plugins [jdhao:using nvim after three years](https://jdhao.github.io/2021/12/31/using_nvim_after_three_years/)
* [sbdchd/neoformat](https://github.com/sbdchd/neoformat)
* kevinhwang91 wrote a couple of intersting plugins:
    * a better quickfix window [kevinhwang91/nvim-bqf](https://github.com/kevinhwang91/nvim-bqf)
    * use ranger in floating window inside nvim [rnvimr](https://github.com/kevinhwang91/rnvimr)
    * a collection of fzf tricks [fzf-tmux-script](https://github.com/kevinhwang91/fzf-tmux-script)
* [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
* [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
* [neoscroll.nvim](ohttps://github.com/karb94/neoscroll.nvim)

### terminal plugins
* [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

### colorthemes
* [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme)

### Various dotfiles for neovim
* [Davi-Kunz/vim](https://github.com/David-Kunz/vim/blob/master/init.lua)
* nvim config with C++ and python [jdhao/nvim-config](https://github.com/jdhao/nvim-config)
* [numToStr/dotfiles](https://github.com/numToStr/dotfiles/tree/master/neovim/.config/nvim)
    * nice neovim config (relatively not complicated)
* [NvChad/NvChad](https://github.com/NvChad/NvChad)
    * [nvchad site](https://nvchad.github.io/getting-started/setup)
* [tjdevries/config_manager](https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim/after/plugin)
* [ChrisAtMachine/LunarVim](https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/keymaps.lua)

### Videos
* [nvim as IDE by DevOnDuty](https://www.youtube.com/playlist?list=PLu-ydI-PCl0OEG0ZEqLRRuCrMJGAAI0tW)
* TJ DeVries: [TakeTusday E01: nvim-cmp](https://www.youtube.com/watch?v=_DnmphIwnjo)
* ChrisAtMachine on [Telescope](https://www.youtube.com/watch?v=OhnLevLpGB4)
* [configuring-neovim-using-lua](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)
* [jdhao: using nvim after three years](https://jdhao.github.io/2021/12/31/using_nvim_after_three_years/)

### Some notes from tj videos
```
-- Native LSP Setup
-- get gopls -> on PATH -> install gopls
-- tell nvim to use gopls
require 'lspconfig'.gopls.setup{
    on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.but.hover, {buffer=0}) -- map K to hover function only in this buffer
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n", "gr", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_previous)
    vim.keymap.set("n", "dl", "<cmd>Telescope diagnostics")
    end,
}   -- connect to server

:LspInfo - command to show which lsp server is connected to file
:help vim.lsp.buf.hover()
:lua vim.lsp.buf.hover()
:lua vim.lsp.buf.code_action()  -- add/organize imports, etc..
:Telescope lsp_references -- show references of the symbol under cursor
:Telescope diagnostics  -- show diagnostics of the project
(and C-q will put them in quick list)

-- Telescope Setup
local action_state = require('telescope.actions.state') -- runtime (Plugin) exists somewhere as lua
require('telescope').setup {
    defaults = {
        prompt_prefix = "$ "
        i = {
            ["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
        }
    }
}
require('telescope').load_extension('fzf')

local mappings = {
}

mappings.curr_buf = function()
    local opt = require('telescope.themes').get_dropdown({height=10, previewer=false})
    require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
return mappings
```
