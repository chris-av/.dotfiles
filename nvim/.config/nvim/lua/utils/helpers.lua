local silicon = require("silicon")
local dap = require('dap')
local telebuiltins = require("telescope.builtin")
local harpoon_mark = require("harpoon.mark")
local buf = vim.lsp.buf
local neotest = require("neotest")

local M = {}

M.prepare_pyenv = function()
  local virtual_env = vim.fn.expand("~/.virtualenvs")
  local debugpy_path = virtual_env .. "/debugpy"

  if vim.fn.isdirectory(virtual_env) == 0 then
    vim.notify("could not find ~/.virtualenvs, creating it now", vim.log.levels.INFO, {
      title = "dap",
    })
    vim.fn.mkdir(virtual_env)
  end

  if vim.fn.isdirectory(debugpy_path) == 0 then
    vim.notify("could not find ~/.virtualenvs/debugpy, creating it now", vim.log.levels.INFO, {
      title = "dap",
    })
    -- run this in the background
    vim.fn.jobstart(
      "python -m venv ~/.virtualenvs/debugpy;~/.virtualenvs/debugpy/bin/python -m pip install debugpy",
      {
        cwd = "",
        on_exit = function()
          print("finished creating virtual environment for debugpy")
        end,
        -- on_stdout = function(out)
        --   print(out)
        -- end,
        on_stderr = function(err)
          print("something went wrong creating the virtual env for debugpy")
          print(err)
        end,
      }
    )
  end
end

M.resourceConfig = function()
  local myvimrc = os.getenv("MYVIMRC")
  print("resourcing config at : " .. myvimrc)
  vim.api.nvim_command("source " .. myvimrc)
end

M.copyFilePath = function()
  local home = os.getenv("HOME")
  local filepath = vim.fn.expand("%:p"):gsub(home, "~")
  vim.fn.setreg("+", filepath)
  vim.notify(filepath, vim.log.levels.INFO, {
    title = " Copied path",
    timeout = 4000,
  })
end

M.ls_ws_folders = function()
  print(vim.inspect(buf.list_workspace_folders()))
end

M.custom_hover = function()
  local hover = buf.hover
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    hover()
  end
end

M.open_diagnostic = function()
  vim.diagnostic.open_float(0, { border = "single" })
end

M.prev_diagnostic = function()
  vim.diagnostic.goto_prev({ float = { border = "single" } })
end

M.next_diagnostic = function()
  vim.diagnostic.goto_next({ float = { border = "single" } })
end

M.format_file = function()
  vim.lsp.buf.format({ async = true, })
end

M.manage_loclist = function()
  vim.diagnostic.setloclist({ open = false }) -- don't open and focus
  local window = vim.api.nvim_get_current_win()
  vim.cmd.lwindow()                           -- open+focus loclist if has entries, else close -- this is the magic toggle command
  vim.api.nvim_set_current_win(window)        -- restore focus to window you were editing (delete this if you want to stay in loclist)
end

M.toggleWrap = function()
  local curr_wrap = vim.wo.wrap
  local new_wrap = not curr_wrap
  print("setting wrap to " .. tostring(new_wrap))
  vim.wo.wrap = new_wrap
end

M.exec_silicon = function()
  local opts = { to_clip = false, show_buf = true, }
  silicon.visualise_api(opts)
end

M.exec_silicon_visual = function()
  local opts = { to_clip = false, }
  silicon.visualise_api(opts)
end

M.toggle_cond_breakpoint = function()
  -- dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
  local condition = vim.fn.input({ prompt = 'Breakpoint Condition: ' })
  if condition then
    dap.toggle_breakpoint(condition, nil, nil, true)
  end
end


M.harpoon_add = function()
  harpoon_mark.add_file()
  local curr_buff = vim.api.nvim_buf_get_name(0)
  print("added " .. curr_buff .. " to harpoon")
end

M.dap_ui_hover = function()
  local widgets = require 'dap.ui.widgets'
  widgets.centered_float(widgets.scopes)
end


M.neotest_summary = function()
  neotest.summary.toggle()
end

M.neotest_run_curr_file = function()
  neotest.run.run(vim.fn.expand("%"))
end

M.neotest_output_panel = function()
  neotest.output_panel.toggle()
end

M.neotest_watch = function()
  neotest.watch.toggle(vim.fn.expand("%"))
end

M.neotest_attach = function()
  neotest.run.attach()
end

M.find_git_ancestor = function()
  local results = vim.fs.find(".git", {
    upward = true,
    type = "directory",
    path = vim.uv.cwd(),
  })
  if #results > 0 then
    return results[1]
  end
  return nil
end

M.find_proj_root = function(patterns)
  return vim.fs.root(0, patterns)
end

local function mkdir_p(path, mode)
  mode = mode or tonumber("755", 8)
  local stat = vim.uv.fs_stat(path)
  if stat then return true end -- Already exists

  local parent = vim.fs.dirname(path)
  if parent ~= nil and parent ~= path then
    mkdir_p(parent, mode)
  end

  return vim.uv.fs_mkdir(path, mode)
end

M.mkdir_p = mkdir_p

return M
