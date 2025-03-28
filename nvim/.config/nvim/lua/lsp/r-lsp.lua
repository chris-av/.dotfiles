local on_attach = require('lsp.on_attach')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config.r_language_server = {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'R', '--slave', '-e', 'languageserver::run()' },
  filetypes = { 'r', 'rmd' },
  log_level = 2,
  root_dir = require("utils.helpers").find_proj_root({ ".Rproj" })
}
