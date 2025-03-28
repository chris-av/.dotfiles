local signs = {
  Error = " ",
  Warn = " ",
  Hint = "󰌶 ",
  Info = " ",
}

-- diagnostics setup
vim.diagnostic.config({
  underline = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info,
    },

    -- make who line red
    -- linehl = {
    --   [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    -- },

    -- highlight line number on warning
    -- numhl = {
    --   [vim.diagnostic.severity.WARN] = 'WarningMsg',
    -- },
  },
  severity_sort = true,
  virtual_text = false,
  -- virtual_text = {
  --   spacing = 4,
  --   prefix = ''
  -- },
  update_in_insert = true
})
