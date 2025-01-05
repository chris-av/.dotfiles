local virtual_env = vim.fn.expand("~/.virtualenvs")
local debugpy_path = virtual_env .. "/debugpy"

if vim.fn.isdirectory(virtual_env) == 0 then
  print("could not find ~/.virtualenvs, creating it now in : " .. virtual_env)
  vim.fn.mkdir(virtual_env)
end

if vim.fn.isdirectory(debugpy_path) == 0 then
  print("could not find debugpy in ~/.virtualenvs, creating it now in : " .. debugpy_path)

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

require('dap-python').setup("~/.virtualenvs/debugpy/bin/python")
