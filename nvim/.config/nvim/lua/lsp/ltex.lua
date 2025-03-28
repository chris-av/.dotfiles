local on_attach = require('lsp.on_attach')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config.ltex = {
  on_attach = on_attach,
  cmd = { 'ltex-ls' },
  filetypes = { 'bib', 'org', 'plaintex', 'rst', 'rnoweb', 'tex' },
}
