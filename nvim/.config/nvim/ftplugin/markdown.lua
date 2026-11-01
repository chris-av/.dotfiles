local wrap_markdown = vim.api.nvim_create_augroup('WrapLineMarkdown', { clear = true })
local markdown = require("render-markdown")

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.md' },
  command = "setlocal wrap",
  group = wrap_markdown
})

vim.keymap.set('n', '<leader>rr', markdown.toggle, { desc = "Render markdown" })
