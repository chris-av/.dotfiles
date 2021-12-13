local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- diagnostics setup
vim.diagnostic.config ({
  underline = false,
  signs = true,
  virtual_text = false,
  -- virtual_text = {
  --   spacing = 4,
  --   prefix = ''
  -- },
  update_in_insert = true
})



vim.cmd([[hi DiagnosticsError ctermfg=red]])
vim.cmd([[hi DiagnosticHint ctermfg=blue]])
vim.cmd([[hi DiagnosticsWarning ctermfg=yellow]])
vim.cmd([[hi DiagnosticsInformation ctermfg=yellow]])

