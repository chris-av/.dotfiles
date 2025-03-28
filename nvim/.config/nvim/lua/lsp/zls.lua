local on_attach = require('lsp.on_attach')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- automatic code formatting, 0 for false, 1 for true
vim.g.zig_fmt_autosave = 0

vim.lsp.config.zls = {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'zls' },
  filetypes = { 'zig', 'zir' },
  root = require("utils.helpers").find_proj_root({ 'zls.json', '.git', })
}
