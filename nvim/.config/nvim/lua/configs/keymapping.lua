local dap = require("dap")
local telescope = require("telescope")
local builtins = require("telescope.builtin")
local helpers = require("utils.helpers")
local opts = { }
local extend = function (tbl, desc)
  return vim.tbl_extend("error", tbl, desc)
end


local debuggers = require('debuggers.node')
local dapui_widgets = require('dap.ui.widgets')


-- reserve space for leader
vim.keymap.set("", "<Space>", "<Nop>", extend(opts, { desc = "reserve space for leader" }))

-- general
vim.keymap.set('n', '<esc><esc>', '<cmd>nohlsearch<CR>', extend(opts, { desc = "stop incremental search" }))
vim.keymap.set('n', '<leader>w', helpers.toggleWrap, extend(opts, { desc = "toggle wrap for the current buffer" }))
vim.keymap.set('n', '<C-g>', helpers.copyFilePath, extend(opts, { desc = "copy filepath" }))

-- marks
vim.keymap.set('n', '<leader>md', ':delmark<CR>', extend(opts, { desc = "Delete mark on current line" }))
vim.keymap.set('n', '<leader>m', ':delm! | delm A-Z0-9<CR>>', extend(opts, { desc = "Delete all marks" }))

-- motions
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- nvim tree key bindings
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', extend(opts, { desc = "toggle nvim tree" }))
vim.keymap.set('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>', extend(opts, { desc = "refresh nvim tree" }))
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', extend(opts, { desc = "find file within nvim tree" }))


-- telescope
vim.keymap.set('n', '<leader>km', builtins.keymaps, extend(opts, { desc = "list keymappings" }))
vim.keymap.set('n', '<leader>co', helpers.preview_colorschemes, extend(opts, { desc = "list colorschemes" }))
vim.keymap.set('n', '<leader>hi', builtins.highlights, extend(opts, { desc = "list highlights" }))
vim.keymap.set('n', 'ff', builtins.find_files, extend(opts, { desc = "find files" }))
vim.keymap.set('n', '<leader>gg', builtins.git_commits, extend(opts, { desc = "list git commits" }))
vim.keymap.set('n', '<leader>/', helpers.curr_buff_srch, extend(opts, { desc = "find in current buffer" }))
vim.keymap.set('n', 'fg', builtins.live_grep, extend(opts, { desc = "live grep" }))
vim.keymap.set('n', '<leader>lb', builtins.buffers, extend(opts, { desc = "list buffers" }))
vim.keymap.set('n', '<leader>?', builtins.help_tags, extend(opts, { desc = "help tags" }))
vim.keymap.set('n', '<leader>ml', builtins.marks, extend(opts, { desc = "list marks" }))


-- bufferline
vim.keymap.set('n', 'Q', '<cmd>Bdelete!<CR>', extend(opts, { desc = "delete buffer" }))
vim.keymap.set('n', 'tl', '<cmd>:tabnext<CR>', extend(opts, { desc = "next tab" }))
vim.keymap.set('n', 'th', '<cmd>:tabprev<CR>', extend(opts, { desc = "previous tab" }))
vim.keymap.set('n', 'ti', '<cmd>:tabnew<CR>', extend(opts, { desc = "new tab" }))


-- harpoon
vim.keymap.set('n', '<S-l>', require("harpoon.ui").nav_next, extend(opts, { desc = "next buffer" }))
vim.keymap.set('n', '<S-h>', require("harpoon.ui").nav_prev, extend(opts, { desc = "previous buffer" }))
vim.keymap.set('n', '<leader>i', helpers.harpoon_add, extend(opts, { desc = "add file to harpoon" }))
vim.keymap.set('n', '<leader>ll', require("harpoon.ui").toggle_quick_menu, extend(opts, { desc = "open harpoon window" }))


-- lazygit
vim.keymap.set('n', '<leader>lg', ':FloatermNew lazygit<CR>', extend(opts, { desc = "launch lazy git" }))
vim.keymap.set('n', '<leader>gs', ':Telescope git_status<CR>', extend(opts, { desc = "git status" }))

-- for debugger
vim.keymap.set('n', '<F12>', dap.step_out, extend(opts, { desc = "Debugger (DAP) - step out" }))
vim.keymap.set('n', '<F11>', dap.step_into, extend(opts, { desc = "Debugger (DAP) - step into" }))
vim.keymap.set('n', '<F10>', dap.step_over, extend(opts, { desc = "Debugger (DAP) - step over" }))
vim.keymap.set('n', '<F5>', dap.continue, extend(opts, { desc = "Debugger (DAP) - continue" }))
vim.keymap.set('n', '<F1>', dap.toggle_breakpoint, extend(opts, { desc = "Debugger (DAP) - toggle breakpoint" }))
vim.keymap.set('n', '<F2>', helpers.toggle_cond_breakpoint, extend(opts, { desc = "Debugger (DAP) - toggle conditional breakpoint" }))
vim.keymap.set('n', '<leader>daa', debuggers.attach, extend(opts, { desc = "Debugger (DAP) - attach" }))
vim.keymap.set('n', '<leader>dar', debuggers.attachToRemote, extend(opts, { desc = "Debugger (DAP) - attach to remote" }))
vim.keymap.set('n', '<F3>', dap.terminate, extend(opts, { desc = "Debugger (DAP) - terminate" }))
vim.keymap.set('n', '<leader>dh', dapui_widgets.hover, extend(opts, { desc = "DAP - widget hover" }))
vim.keymap.set('n', '<leader>dr', helpers.dap_ui_hover, extend(opts, { desc = "DAP - center widgets" }))


-- telescope-dap
local exts = telescope.extensions
vim.keymap.set('n', '<leader>dc', exts.dap.configurations, extend(opts, { desc = "DAP - see configurations" }))
vim.keymap.set('n', '<leader>dd', dap.clear_breakpoints, extend(opts, { desc = "DAP - clear breakpoints" }))
vim.keymap.set('n', '<leader>dl', exts.dap.list_breakpoints, extend(opts, { desc = "DAP -  list breakpoints" }))
vim.keymap.set('n', '<leader>df', exts.dap.frames, extend(opts, { desc = "DAP - open frames" }))

-- silicon
vim.keymap.set('n', '<leader>s', helpers.exec_silicon, extend(opts, { desc = "Silicon - save contents of buffer" }))
vim.keymap.set('v', '<leader>s', helpers.exec_silicon_visual, extend(opts, { desc = "Silicon - save visual selected lines" }))

-- re-source files
vim.keymap.set("n", "<leader>ss", helpers.resourceConfig, extend(opts, { desc = "source the lua config again" }))



-- expand window
vim.keymap.set("n", "<Left>", "<cmd>:vertical resize -2<CR>", extend(opts, { desc = "Contract buffer horizontally" }))
vim.keymap.set("n", "<Right>", "<cmd>:vertical resize +2<CR>", extend(opts, { desc = "Expand buffer horizontally" }))
vim.keymap.set("n", "<Down>", "<cmd>:resize -2<CR>", extend(opts, { desc = "Contract buffer vertically" }))
vim.keymap.set("n", "<Up>", "<cmd>:resize +2<CR>", extend(opts, { desc = "Expand window vertically" }))

-- neotest
vim.keymap.set("n", "<leader>tt", helpers.neotest_run_curr_file, extend(opts, { desc = "Neotest - run current file" }))
vim.keymap.set("n", "<leader>tl", helpers.neotest_summary, extend(opts, { desc = "Neotest - run current file" }))
vim.keymap.set("n", "<leader>to", helpers.neotest_output_panel, extend(opts, { desc = "Neotest - show output panel" }))
vim.keymap.set("n", "<leader>ta", helpers.neotest_attach, extend(opts, { desc = "Neotest - attach" }))
vim.keymap.set("n", "<leader>tw", helpers.neotest_watch, extend(opts, { desc = "Neotest - attach" }))
