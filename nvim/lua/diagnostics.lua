local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- icon
-- check to see if vim.lsp.diagnostic.on_publish_diagnostics() is stil valid
-- might have to change to vim.diagnostic.on_publish_diagnostics()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    signs = true,
    virtual_text = {
      spacing = 4,
      prefix = ''
    },
    update_in_insert = true
  }
)



vim.cmd([[hi LspDiagnosticsDefaultError ctermfg=red]])
vim.cmd([[hi LspDiagnosticsDefaultHint ctermfg=blue]])
vim.cmd([[hi LspDiagnosticsDefaultWarning ctermfg=yellow]])
vim.cmd([[hi LspDiagnosticsDefaultInformation ctermfg=yellow]])
