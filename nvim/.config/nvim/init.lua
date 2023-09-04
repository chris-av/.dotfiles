-- highlight groups, options, etc
require('configs')



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

local iterm_prof = os.getenv('ITERM_PROFILE')
local term_prof = os.getenv('TERM_PROFILE')
local prof = iterm_prof

local function isempty(s)
  return s == nil or s == ''
end


if (isempty(iterm_prof)) then
  prof = term_prof
elseif (isempty(iterm_prof) and isempty(term_prof)) then
  prof = "default"
end

if (string.match(prof, "Material Deep Ocean")) then
  vim.cmd" colorscheme material "
elseif (string.match(prof, 'Catppuccin')) then
  vim.cmd" colorscheme catppuccin "
elseif (prof == 'Embark') then
  vim.cmd" colorscheme embark "
elseif (prof == 'Dark') then
  vim.cmd" colorscheme dark "
elseif (prof == 'Coal') then
  vim.cmd" colorscheme coal "
elseif (prof == 'Matrix') then
  vim.cmd" colorscheme matrix "
end



