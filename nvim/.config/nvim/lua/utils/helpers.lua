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
