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
vim.cmd('highlight clear SignColumn')
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
vim.g.mapleader = " "
vim.o.showmode = false
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
