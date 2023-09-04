vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'gitcommit' },
  command = "setlocal tw=72"
})

