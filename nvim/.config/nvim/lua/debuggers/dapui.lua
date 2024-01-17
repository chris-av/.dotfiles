local dap = require('dap')
local dapui = require('dapui')


dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({ reset = true, })
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


dapui.setup({
  icons = { expanded = "", collapsed = "", circular = "" },
  expand_lines = false,
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  layouts = {
    {
      elements = {
        { id = 'scopes',      size = 0.40 },
        { id = 'watches',     size = 0.40 },
        { id = 'breakpoints', size = 0.10 },
        { id = 'stacks',      size = 0.10 },
      },
      size = 40,
      position = 'left'
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 30,
      position = 'bottom'
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      disconnect = "",
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = ""
    },
  },
  floating = {
    max_height = nil,  -- These can be integers or a float between 0 and 1.
    max_width = nil,   -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})
