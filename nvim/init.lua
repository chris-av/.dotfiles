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
require 'debugger'




