local signs = {
  Error = " ",
  Warn = " ",
  Hint = "󰌶 ",
  Info = " ",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- diagnostics setup
vim.diagnostic.config ({
  underline = false,
  signs = true,
  severity_sort = true,
  virtual_text = false,
  -- virtual_text = {
  --   spacing = 4,
  --   prefix = ''
  -- },
  update_in_insert = true
})
