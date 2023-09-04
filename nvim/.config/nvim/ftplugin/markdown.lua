local wrap_markdown = vim.api.nvim_create_augroup('WrapLineMarkdown', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.md' },
  command = "setlocal wrap",
  group = wrap_markdown
})

