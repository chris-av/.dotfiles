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


-- lazygit
vim.keymap.set('n', '<leader>lg', ':FloatermNew lazygit<CR>', { desc = "launch lazy git" })
vim.keymap.set('n', '<leader>gs', ':Telescope git_status<CR>', { desc = "git status" })

-- re-source files
vim.keymap.set("n", "<leader>ss", helpers.resourceConfig, { desc = "source the lua config again" })


-- expand window
vim.keymap.set("n", "<Left>", "<cmd>:vertical resize -2<CR>", { desc = "Contract buffer horizontally" })
vim.keymap.set("n", "<Right>", "<cmd>:vertical resize +2<CR>", { desc = "Expand buffer horizontally" })
vim.keymap.set("n", "<Down>", "<cmd>:resize -2<CR>", { desc = "Contract buffer vertically" })
vim.keymap.set("n", "<Up>", "<cmd>:resize +2<CR>", { desc = "Expand window vertically" })
