local vim = vim

-- make sure iTerm2 has "report mouse wheel events" turned off
vim.o.mouse = 'a'
vim.o.syntax = 'on'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.number = true
vim.bo.autoindent = true
vim.bo.smartindent = true
vim.o.backspace = 'indent,eol,start'
vim.o.encoding = 'UTF-8'
vim.o.signcolumn = 'number'
vim.o.showmatch = true
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.wo.wrap = false
vim.o.sidescroll=1
vim.o.shortmess= vim.o.shortmess .. 'c'
vim.o.guicursor = 'i:block,a:blinkon100'
vim.bo.swapfile = true
vim.o.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.g.mapleader = " " -- map leader defined in nvim/lua/lsp/keymappings.lua
vim.g.localmapleader = " "
vim.o.showmode = false
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.opt.laststatus = 3
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.termguicolors = true
vim.api.nvim_set_option("clipboard", "unnamed")
vim.wo.foldlevel = 99
vim.opt.guifont = "Hack Nerd Font:h11"
vim.g.neovide_remember_window = true
vim.g.neovide_fullscreen = true


-- will get over written by other plugins
-- I this does not work with nvim-tree since you need to rerun this on every new buffer
-- vim.opt.winbar = "%=%m %f"
