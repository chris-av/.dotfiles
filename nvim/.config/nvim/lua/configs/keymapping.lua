local builtins = require("telescope.builtin")
local helpers = require("utils.helpers")

-- reserve space for leader
vim.keymap.set("", "<Space>", "<Nop>", { desc = "reserve space for leader" })

-- general
vim.keymap.set('n', '<esc><esc>', '<cmd>nohlsearch<CR>', { desc = "stop incremental search" })
vim.keymap.set('n', '<leader>w', helpers.toggleWrap, { desc = "toggle wrap for the current buffer" })
vim.keymap.set('n', '<C-g>', helpers.copyFilePath, { desc = "copy filepath" })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "cross to left buffer", })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "cross to bottom buffer", })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "cross to upper buffer", })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "cross to right buffer", })

-- marks
vim.keymap.set('n', '<leader>md', ':delmark<CR>', { desc = "Delete mark on current line" })
vim.keymap.set('n', '<leader>m', ':delm! | delm A-Z0-9<CR>>', { desc = "Delete all marks" })

-- motions
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- telescope
vim.keymap.set('n', '<leader>km', builtins.keymaps, { desc = "list keymappings" })
vim.keymap.set('n', '<leader>co', helpers.preview_colorschemes, { desc = "list colorschemes" })
vim.keymap.set('n', '<leader>hi', builtins.highlights, { desc = "list highlights" })
vim.keymap.set('n', 'ff', builtins.find_files, { desc = "find files" })
vim.keymap.set('n', '<leader>gg', builtins.git_commits, { desc = "list git commits" })
vim.keymap.set('n', '<leader>/', helpers.curr_buff_srch, { desc = "find in current buffer" })
vim.keymap.set('n', 'fg', builtins.live_grep, { desc = "live grep" })
vim.keymap.set('n', '<leader>lb', builtins.buffers, { desc = "list buffers" })
vim.keymap.set('n', '<leader>?', builtins.help_tags, { desc = "help tags" })
vim.keymap.set('n', '<leader>ml', builtins.marks, { desc = "list marks" })


-- bufferline
vim.keymap.set('n', 'Q', '<cmd>Bdelete!<CR>', { desc = "delete buffer" })
vim.keymap.set('n', 'tl', '<cmd>:tabnext<CR>', { desc = "next tab" })
vim.keymap.set('n', 'th', '<cmd>:tabprev<CR>', { desc = "previous tab" })
vim.keymap.set('n', 'ti', '<cmd>:tabnew<CR>', { desc = "new tab" })


-- harpoon
vim.keymap.set('n', '<S-l>', require("harpoon.ui").nav_next, { desc = "next buffer" })
vim.keymap.set('n', '<S-h>', require("harpoon.ui").nav_prev, { desc = "previous buffer" })
vim.keymap.set('n', '<leader>i', helpers.harpoon_add, { desc = "add file to harpoon" })
vim.keymap.set('n', '<leader>ll', require("harpoon.ui").toggle_quick_menu, { desc = "open harpoon window" })


-- lazygit
vim.keymap.set('n', '<leader>lg', ':FloatermNew lazygit<CR>', { desc = "launch lazy git" })
vim.keymap.set('n', '<leader>gs', ':Telescope git_status<CR>', { desc = "git status" })


-- telescope-dap

-- silicon
vim.keymap.set('n', '<leader>s', helpers.exec_silicon, { desc = "Silicon - save contents of buffer" })
vim.keymap.set('v', '<leader>s', helpers.exec_silicon_visual, { desc = "Silicon - save visual selected lines" })

-- re-source files
vim.keymap.set("n", "<leader>ss", helpers.resourceConfig, { desc = "source the lua config again" })


-- expand window
vim.keymap.set("n", "<Left>", "<cmd>:vertical resize -2<CR>", { desc = "Contract buffer horizontally" })
vim.keymap.set("n", "<Right>", "<cmd>:vertical resize +2<CR>", { desc = "Expand buffer horizontally" })
vim.keymap.set("n", "<Down>", "<cmd>:resize -2<CR>", { desc = "Contract buffer vertically" })
vim.keymap.set("n", "<Up>", "<cmd>:resize +2<CR>", { desc = "Expand window vertically" })

-- neotest
vim.keymap.set("n", "<leader>tt", helpers.neotest_run_curr_file, { desc = "Neotest - run current file" })
vim.keymap.set("n", "<leader>tl", helpers.neotest_summary, { desc = "Neotest - run current file" })
vim.keymap.set("n", "<leader>to", helpers.neotest_output_panel, { desc = "Neotest - show output panel" })
vim.keymap.set("n", "<leader>ta", helpers.neotest_attach, { desc = "Neotest - attach" })
vim.keymap.set("n", "<leader>tw", helpers.neotest_watch, { desc = "Neotest - attach" })
