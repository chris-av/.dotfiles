-- highlight groups, options, etc
require('configs')
local colorutils = require('utils/colorutils')



local group_skeleton = vim.api.nvim_create_augroup('skeleton', { clear = true })

vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = { 'index.html' },
  command = "silent! execute '0r ~/.config/nvim/templates/index.'.expand('<afile>:e')",
  group = group_skeleton
})

vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = { '*.sh' },
  command = "silent! execute '0r ~/.config/nvim/templates/script.'.expand('<afile>:e') | 3",
  group = group_skeleton
})

vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = { 'jsconfig.json' },
  command = "silent! execute '0r ~/.config/nvim/templates/jsconfig.'.expand('<afile>:e')",
  group = group_skeleton
})

require('diagnostics')
require('packages')
require('lsp')
require('debuggers')
require('pkgs')


colorutils.set_colorscheme()

