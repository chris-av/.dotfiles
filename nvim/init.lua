local vim = vim
local fn = vim.fn

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
-- do option for sign column
vim.cmd('highlight clear SignColumn')
vim.o.showmatch = true
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.wo.wrap = false
vim.o.sidescroll=1
vim.o.shortmess= vim.o.shortmess .. 'c'
vim.o.guicursor = 'i:block,a:blinkon100'
vim.bo.swapfile = true
vim.o.cursorline = true


-- try out some colors
-- if you define invalid colors, the pmenu ends up looking aweseome???
vim.cmd([[ highlight Pmenu ctermfg=black ctermbg=DarkGreen ]])
vim.cmd([[ highlight PmenuSel ctermfg=white ctermbg=DarkGreen ]])
vim.cmd([[ highlight NormalFloat guifg=black guibg=black ]])
vim.cmd([[ highlight FloatBorder guifg=black guibg=black ]])
-- vim.cmd([[ highlight NormalFloat ctermbg=black ]])
-- vim.cmd([[ highlight NormalFloat ctermbg=black ]])
vim.cmd([[ highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE ]])
vim.cmd([[ highlight LineNr ctermbg=NONE ]])
vim.cmd([[ highlight CursorLineNR cterm=bold ]])
vim.cmd([[ highlight VertSplit ctermbg=DarkGreen ctermfg=black guifg=black guibg=black ]])

vim.api.nvim_set_keymap('i', '<F1>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<F1>', '<nop>', { noremap = true, silent = true })


vim.cmd('au FileType gitcommit setlocal tw=72')

vim.cmd([[
augroup skeletons
  au!
  autocmd BufNewFile *.* silent! execute '0r ~/.config/nvim/templates/index.'.expand("<afile>:e")
augroup END
]])


 -- packer management
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')



-- requires plugins in lua/plugins
require 'plugins'

-- requires entry lua/main
require 'main'

