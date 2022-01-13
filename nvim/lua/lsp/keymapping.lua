local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.localmapleader = " "


-- general
keymap('n', '<esc><esc>', '<cmd>nohlsearch<CR>', opts)


-- nvim tree key bindings
keymap('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', opts)
keymap('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>', opts)
keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', opts)


-- telescope
keymap('n', 'ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
keymap('n', 'fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap('n', 'fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
keymap('n', 'fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)


-- bufferline
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bnext<CR>', opts)
keymap('n', 'Q', '<cmd>Bdelete!<CR>', opts)


-- for debugger
keymap('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>', opts)
keymap('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>', opts)
keymap('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>', opts)
keymap('n', '<F5>', '<cmd>lua require"dap".continue()<CR>', opts)
keymap('n', '<F1>', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
keymap('n', '<leader>da', '<cmd>lua require("debuggers.node").attach()<CR>', opts)
keymap('n', '<leader>dA', '<cmd>lua require("debuggers.node").attachToRemote()<CR>', opts)
keymap('n', '<F3>', '<cmd>lua require("debuggers.node").attachClose()<CR>', opts)
keymap('n', '<F4>', '<cmd>lua require("debuggers.node").attachToRemoteClose()<CR>', opts)

keymap('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>', opts)
keymap('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>', opts)
keymap('v', '<leader>dhv',
          '<cmd>lua require"dap.ui.variables".visual_hover()<CR>', opts)

keymap('n', '<leader>duh', '<cmd>lua reuire"dap.ui.widgets".hover()<CR>', opts)
keymap('n', '<leader>duf',
          "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>", opts)

keymap('n', '<leader>dsbr',
          '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
keymap('n', '<leader>dsbm',
          '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)
keymap('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>', opts)
keymap('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>', opts)


-- telescope-dap
keymap('n', '<leader>dcc',
          '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', opts)
keymap('n', '<leader>dco',
          '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', opts)
keymap('n', '<leader>dlb',
          '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', opts)
keymap('n', '<leader>dv',
          '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', opts)
keymap('n', '<leader>df',
          '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', opts)


