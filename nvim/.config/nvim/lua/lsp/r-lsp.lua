local on_attach = require('lsp.on_attach') 
local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

nvim_lsp['r_language_server'].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'R', '--slave', '-e', 'languageserver::run()' },
  filetypes = { 'r', 'rmd' },
  log_level = 2,
  root_dir = nvim_lsp.util.root_pattern('')
})
