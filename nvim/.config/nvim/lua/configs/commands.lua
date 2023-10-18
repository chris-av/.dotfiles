local launch_bashserver = function()
  local config = {
    cmd = { 'bash-language-server', 'start' },
  }
  local client_id = vim.lsp.start_client(config)
  if client_id then
    vim.lsp.buf_attach_client(0, client_id)
  end
end


vim.api.nvim_create_user_command(
  'LaunchBashServer',
  launch_bashserver,
  { desc = "Start bash lsp" }
)


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

