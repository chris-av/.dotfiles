return function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'SH', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float(0, { border = "single" })<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "single" }})<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({ float = { border = "single" }})<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- nvim tree key bindings
  buf_set_keymap('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', opts)
  buf_set_keymap('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>', opts)
  buf_set_keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', opts)
  buf_set_keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', opts)


  -- telescope
  buf_set_keymap('n', 'ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
  buf_set_keymap('n', 'fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
  buf_set_keymap('n', 'fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
  buf_set_keymap('n', 'fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)


  -- for debugger
  buf_set_keymap('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>', opts)
  buf_set_keymap('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>', opts)
  buf_set_keymap('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>', opts)
  buf_set_keymap('n', '<F5>', '<cmd>lua require"dap".continue()<CR>', opts)
  buf_set_keymap('n', '<F1>', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
  buf_set_keymap('n', '<leader>da', '<cmd>lua require("node_adapter").attach()<CR>', opts)
  buf_set_keymap('n', '<leader>dA', '<cmd>lua require("node_adapter").attachToRemote()<CR>', opts)
  buf_set_keymap('n', '<F3>', '<cmd>lua require("node_adapter").attachClose()<CR>', opts)
  buf_set_keymap('n', '<F4>', '<cmd>lua require("node_adapter").attachToRemoteClose()<CR>', opts)

  buf_set_keymap('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>', opts)
  buf_set_keymap('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>', opts)
  buf_set_keymap('v', '<leader>dhv',
            '<cmd>lua require"dap.ui.variables".visual_hover()<CR>', opts)

  buf_set_keymap('n', '<leader>duh', '<cmd>lua reuire"dap.ui.widgets".hover()<CR>', opts)
  buf_set_keymap('n', '<leader>duf',
            "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>", opts)

  buf_set_keymap('n', '<leader>dsbr',
            '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
  buf_set_keymap('n', '<leader>dsbm',
            '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)
  buf_set_keymap('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>', opts)
  buf_set_keymap('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>', opts)


  -- telescope-dap
  buf_set_keymap('n', '<leader>dcc',
            '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', opts)
  buf_set_keymap('n', '<leader>dco',
            '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', opts)
  buf_set_keymap('n', '<leader>dlb',
            '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', opts)
  buf_set_keymap('n', '<leader>dv',
            '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', opts)
  buf_set_keymap('n', '<leader>df',
            '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', opts)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single", color = "red" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

end
