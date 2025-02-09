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


local group = vim.api.nvim_create_augroup('term', { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = {},
  command = "setlocal listchars = nonumber norelativenumber",
  group = group,
})
