local vim = vim
local fn = vim.fn

-- highlight groups, options, etc
require('configs')


-- indent on git files
vim.cmd('au FileType gitcommit setlocal tw=72')

-- use template html file
vim.cmd([[
augroup skeletons
  au!
  autocmd BufNewFile *.* silent! execute '0r ~/.config/nvim/templates/index.'.expand("<afile>:e")
augroup END
]])



require 'completions'
require 'diagnostics'
require 'packages'
require 'lsp'
require 'debugger'




