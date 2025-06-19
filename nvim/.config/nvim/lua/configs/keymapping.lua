local notify = require("utils.notifications")
local toggleWrap = function()
  local curr_wrap = vim.wo.wrap
  local new_wrap = not curr_wrap
  print("setting wrap to " .. tostring(new_wrap))
  vim.wo.wrap = new_wrap
end

local copyFilePath = function()
  local home = os.getenv("HOME")
  local filepath = vim.fn.expand("%:p"):gsub(home, "~")
  vim.fn.setreg("+", filepath)
  notify.notify_info("sys", "Copied path")
end

local resourceConfig = function()
  local myvimrc = os.getenv("MYVIMRC")
  print("resourcing config at : " .. myvimrc)
  vim.api.nvim_command("source " .. myvimrc)
end

-- reserve space for leader
vim.keymap.set("", "<Space>", "<Nop>", { desc = "reserve space for leader" })

-- general
vim.keymap.set('n', '<esc><esc>', '<cmd>nohlsearch<CR>', { desc = "stop incremental search" })
vim.keymap.set('n', '<leader>w', toggleWrap, { desc = "toggle wrap for the current buffer" })
vim.keymap.set('n', '<C-g>', copyFilePath, { desc = "copy filepath" })
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
vim.keymap.set("n", "<leader>ss", resourceConfig, { desc = "source the lua config again" })


-- expand window
vim.keymap.set("n", "<Left>", "<cmd>:vertical resize -2<CR>", { desc = "Contract buffer horizontally" })
vim.keymap.set("n", "<Right>", "<cmd>:vertical resize +2<CR>", { desc = "Expand buffer horizontally" })
vim.keymap.set("n", "<Down>", "<cmd>:resize -2<CR>", { desc = "Contract buffer vertically" })
vim.keymap.set("n", "<Up>", "<cmd>:resize +2<CR>", { desc = "Expand window vertically" })
