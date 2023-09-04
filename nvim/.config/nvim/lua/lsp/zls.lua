local on_attach = require('lsp.on_attach')
local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


-- automatic code formatting, 0 for false, 1 for true
vim.g.zig_fmt_autosave = 0


nvim_lsp['zls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'zls' },
  filetypes = { 'zig', 'zir' },
  root = nvim_lsp.util.root_pattern('zls.json', '.git')
}

