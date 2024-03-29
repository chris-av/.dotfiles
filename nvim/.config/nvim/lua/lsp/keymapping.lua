local opts = { }
local extend = function (tbl, desc)
  return vim.tbl_extend("error", tbl, desc)
end


local telescope = require('telescope')
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")
local telebuiltins = require('telescope.builtin')
local debuggers = require('debuggers.node')
local dap = require('dap')
local dapui_widgets = require('dap.ui.widgets')
local silicon = require("silicon")



local curr_buff_srch = function()
  local themes = require('telescope.themes')
  local previewer = themes.get_dropdown({ previewer = false })
  telebuiltins.current_buffer_fuzzy_find(previewer)
end

local toggleWrap = function ()
  local curr_wrap = vim.wo.wrap
  local new_wrap = not curr_wrap
  print("setting wrap to " .. tostring(new_wrap))
  vim.wo.wrap = new_wrap
end

local exec_silicon = function()
  opts = { to_clip = false, show_buf = true, }
  silicon.visualise_api(opts)
end

local toggle_cond_breakpoint = function()
  -- dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
  local condition = vim.fn.input({ prompt = 'Breakpoint Condition: '})
  if condition then
    dap.toggle_breakpoint(condition, nil, nil, true)
  end
end


local harpoon_add = function()
  harpoon_mark.add_file()
  local curr_buff=  vim.api.nvim_buf_get_name(0)
  print("added " .. curr_buff .. " to harpoon")
end

-- reserve space for leader
vim.keymap.set("", "<Space>", "<Nop>", extend(opts, { desc = "reserve space for leader" }))

-- general
vim.keymap.set('n', '<esc><esc>', '<cmd>nohlsearch<CR>', extend(opts, { desc = "stop incremental search" }))
vim.keymap.set('n', '<C-d>', '<C-d>zz', extend(opts, { desc = "paginate down and center" }))
vim.keymap.set('n', '<C-u>', '<C-u>zz', extend(opts, { desc = "paginate up and center" }))
vim.keymap.set('n', '<leader>w', toggleWrap, extend(opts, { desc = "toggle wrap for the current buffer" }))


-- nvim tree key bindings
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', extend(opts, { desc = "toggle nvim tree" }))
vim.keymap.set('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>', extend(opts, { desc = "refresh nvim tree" }))
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', extend(opts, { desc = "find file within nvim tree" }))


-- telescope
vim.keymap.set('n', '<leader>km', telebuiltins.keymaps, extend(opts, { desc = "list keymappings" }))
vim.keymap.set('n', '<leader>co', function ()
  telebuiltins.colorscheme({ enable_preview = true, })
end, extend(opts, { desc = "list colorschemes" }))
vim.keymap.set('n', '<leader>hi', telebuiltins.highlights, extend(opts, { desc = "list highlights" }))
vim.keymap.set('n', 'ff', telebuiltins.find_files, extend(opts, { desc = "find files" }))
vim.keymap.set('n', '<leader>gg', telebuiltins.git_commits, extend(opts, { desc = "list git commits" }))
vim.keymap.set('n', '<leader>/', curr_buff_srch, extend(opts, { desc = "find in current buffer" }))
vim.keymap.set('n', 'fg', telebuiltins.live_grep, extend(opts, { desc = "live grep" }))
vim.keymap.set('n', 'fb', telebuiltins.buffers, extend(opts, { desc = "get buffers" }))
vim.keymap.set('n', 'fh', telebuiltins.help_tags, extend(opts, { desc = "help tags" }))


-- bufferline
-- vim.keymap.set('n', '<S-l>', ':bnext<CR>', extend(opts, { desc = "next buffer" }))
-- vim.keymap.set('n', '<S-h>', ':bprevious<CR>', extend(opts, { desc = "previous buffer" }))
vim.keymap.set('n', 'Q', '<cmd>Bdelete!<CR>', extend(opts, { desc = "delete buffer" }))
vim.keymap.set('n', 'tl', '<cmd>:tabnext<CR>', extend(opts, { desc = "next tab" }))
vim.keymap.set('n', 'th', '<cmd>:tabprev<CR>', extend(opts, { desc = "previous tab" }))
vim.keymap.set('n', 'ti', '<cmd>:tabnew<CR>', extend(opts, { desc = "new tab" }))


-- harpoon
vim.keymap.set('n', '<S-l>', require("harpoon.ui").nav_next, extend(opts, { desc = "next buffer" }))
vim.keymap.set('n', '<S-h>', require("harpoon.ui").nav_prev, extend(opts, { desc = "previous buffer" }))
vim.keymap.set('n', '<leader>i', harpoon_add, extend(opts, { desc = "add file to harpoon" }))
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
vim.keymap.set('n', '<F2>', toggle_cond_breakpoint, extend(opts, { desc = "Debugger (DAP) - toggle conditional breakpoint" }))
vim.keymap.set('n', '<leader>daa', debuggers.attach, extend(opts, { desc = "Debugger (DAP) - attach" }))
vim.keymap.set('n', '<leader>dar', debuggers.attachToRemote, extend(opts, { desc = "Debugger (DAP) - attach to remote" }))
vim.keymap.set('n', '<F3>', dap.terminate, extend(opts, { desc = "Debugger (DAP) - terminate" }))

vim.keymap.set('n', '<leader>dh', dapui_widgets.hover, extend(opts, { desc = "DAP - widget hover" }))
vim.keymap.set('n', '<leader>dr',
          function ()
            local widgets=require'dap.ui.widgets'
            widgets.centered_float(widgets.scopes)
          end,
          extend(opts, { desc = "DAP - center widgets" }))


-- telescope-dap
vim.keymap.set('n', '<leader>dc',
          telescope.extensions.dap.configurations,
          extend(opts, { desc = "DAP - see configurations" }))
vim.keymap.set('n', '<leader>dd',
          dap.clear_breakpoints,
          extend(opts, { desc = "DAP - clear breakpoints" }))
vim.keymap.set('n', '<leader>dl',
          telescope.extensions.dap.list_breakpoints,
          extend(opts, { desc = "DAP -  list breakpoints" }))
vim.keymap.set('n', '<leader>df',
          telescope.extensions.dap.frames,
          extend(opts, { desc = "DAP - open frames" }))


-- markdown
vim.keymap.set('n', '<leader>m', ':MarkdownPreviewToggle<CR>', extend(opts, { desc = "Toggle MarkdownPreview" }))

-- silicon
vim.keymap.set('n', '<leader>s', exec_silicon, extend(opts, { desc = "Silicon - save contents of buffer" }))
vim.keymap.set('v', '<leader>s', function() silicon.visualise_api({ to_clip = false, }) end, extend(opts, { desc = "Silicon - save visual selected lines" }))


local resourceConfig = function()
  local myvimrc = os.getenv("MYVIMRC")
  print("resourcing config at : " .. myvimrc)
  vim.api.nvim_command("source " .. myvimrc)
end

-- resource files
vim.keymap.set("n", "<leader>ss",
  resourceConfig,
  extend(opts, { desc = "source the lua config again" }))



-- expand window
vim.keymap.set("n", "<Left>", "<cmd>:vertical resize -2<CR>", extend(opts, { desc = "Contract buffer horizontally" }))
vim.keymap.set("n", "<Right>", "<cmd>:vertical resize +2<CR>", extend(opts, { desc = "Expand buffer horizontally" }))
vim.keymap.set("n", "<Down>", "<cmd>:resize -2<CR>", extend(opts, { desc = "Contract buffer vertically" }))
vim.keymap.set("n", "<Up>", "<cmd>:resize +2<CR>", extend(opts, { desc = "Expand window vertically" }))


