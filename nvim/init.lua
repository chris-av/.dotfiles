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
vim.o.splitbelow = true
vim.o.splitright = true


-- try out some colors
-- if you define invalid colors, the pmenu ends up looking aweseome???
vim.cmd([[ highlight Pmenu ctermfg=black ctermbg=DarkGreen guifg=black guibg=LightGreen ]])
vim.cmd([[ highlight PmenuSel ctermfg=white ctermbg=DarkGreen guifg=white guibg=LightGreen ]])
vim.cmd([[ highlight NormalFloat ctermfg=white ctermbg=black guifg=white guibg=black ]])
vim.cmd([[ highlight FloatBorder ctermfg=white ctermbg=black guifg=white guibg=black ]])
-- vim.cmd([[ highlight NormalFloat ctermbg=black ]])
-- vim.cmd([[ highlight NormalFloat ctermbg=black ]])
vim.cmd([[ highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE ]])
vim.cmd([[ highlight LineNr ctermbg=NONE guibg=NONE guifg=LightGreen ]])
vim.cmd([[ highlight CursorLineNR cterm=bold gui=bold ]])
vim.cmd([[ highlight VertSplit ctermbg=DarkGreen ctermfg=black ctermbg=black guifg=black guibg=black ]])

vim.cmd([[ highlight SignifySignAdd ctermfg=green guifg=#00ff00 cterm=NONE gui=NONE ]])
vim.cmd([[ highlight SignifySignDelete ctermfg=red guifg=#00ff00 cterm=NONE gui=NONE ]])
vim.cmd([[ highlight SignifySignChange ctermfg=yellow guifg=#00ff00 cterm=NONE gui=NONE ]])

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


require 'completions'
require 'diagnostics'
require 'packages'
require 'lsp'


if vim.api.nvim_eval("exists('g:neovide')") == 1 then
  -- print('running setup!')
  -- print('running setup!')
  vim.g.material_style = 'deep ocean'

  vim.cmd[[ colorscheme material ]]
  vim.cmd[[ set guifont=Hack\ Nerd\ Font:h12 ]]

  require('material').setup{
    custom_highlights = {
      NvimTreeFolderIcon = 'blue',
      NvimTreeGitNew = 'blue',
      NvimTreeGitDirty = 'red',
      NvimTreeGitStaged = 'LightGreen'
    }
  }

  vim.cmd[[ set termguicolors ]] -- this variable must be enabled for colors to be applied properly
  -- vim.cmd[[ highlight NvimTreeFolderIcon ctermfg=blue guifg=blue ]]
  -- vim.cmd[[ highlight NvimTreeGitNew ctermfg=blue guifg=blue ]]
  -- vim.cmd[[ highlight NvimTreeGitDirty ctermfg=red guifg=red ]]
  -- vim.cmd[[ highlight NvimTreeGitStaged ctermfg=DarkGreen guifg=DarkGreen ]]
end



