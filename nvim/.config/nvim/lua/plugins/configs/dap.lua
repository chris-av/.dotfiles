return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-telescope/telescope-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
    "mfussenegger/nvim-dap-python",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    local dapui_widgets = require('dap.ui.widgets')
    local telescope = require("telescope")
    local helpers = require("utils.helpers")

    telescope.load_extension('dap')

    dap.set_log_level('DEBUG')

    local signs = {
      DapBreakpoint = { icon = "", hl = { fg = "red", bg = "" } },
      DapStopped = { icon = "", hl = { fg = "red", bg = "" } },
      DapBreakpointCondition = { icon = "", hl = { fg = "orange", bg = "", bold = true } },
      DapBreakpointRejected = { icon = "", hl = { fg = "red", bg = "" } },
      DapLogPoint = { icon = "", hl = { fg = "cyan", bg = "" } },
    }

    for name, info in pairs(signs) do
      local icon = info.icon
      local fg = info.hl.fg
      local bg = info.hl.bg
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      vim.api.nvim_set_hl(0, name, { fg = fg, bg = bg })
    end

    -- dapui
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

    -- node debuggers
    local node_config = require("debuggers.node")
    dap.adapters.node = node_config.adapter
    dap.configurations.javascript = node_config.configurations


    -- python debugger setup
    helpers.prepare_pyenv()
    require('dap-python').setup("~/.virtualenvs/debugpy/bin/python")

    local python_config = require("debuggers.python")
    dap.configurations.python = python_config.configurations

    local toggle_cond_breakpoint = function()
      -- dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      local condition = vim.fn.input({ prompt = 'Breakpoint Condition: ' })
      if condition then
        dap.toggle_breakpoint(condition, nil, nil, true)
      end
    end

    local dap_ui_hover = function()
      local widgets = require 'dap.ui.widgets'
      widgets.centered_float(widgets.scopes)
    end

    -- runners
    vim.keymap.set("n", "<leader>daa", node_config.runners.attachGeneric, { desc = "Debugger (DAP) - attach" })
    vim.keymap.set("n", "<leader>dar", node_config.runners.attachToRemote, { desc = "Debugger (DAP) - attach to remote" })
    vim.keymap.set('n', '<leader>dh', dapui_widgets.hover, { desc = "DAP - widget hover" })

    -- debugging
    vim.keymap.set('n', '<F12>', dap.step_out, { desc = "Debugger (DAP) - step out" })
    vim.keymap.set('n', '<F11>', dap.step_into, { desc = "Debugger (DAP) - step into" })
    vim.keymap.set('n', '<F10>', dap.step_over, { desc = "Debugger (DAP) - step over" })
    vim.keymap.set('n', '<F5>', dap.continue, { desc = "Debugger (DAP) - continue" })
    vim.keymap.set('n', '<F1>', dap.toggle_breakpoint, { desc = "Debugger (DAP) - toggle breakpoint" })
    vim.keymap.set('n', '<F2>', toggle_cond_breakpoint,
      { desc = "Debugger (DAP) - toggle conditional breakpoint" })
    vim.keymap.set('n', '<F3>', dap.terminate, { desc = "Debugger (DAP) - terminate" })
    vim.keymap.set('n', '<leader>dr', dap_ui_hover, { desc = "DAP - center widgets" })

    local exts = telescope.extensions
    vim.keymap.set('n', '<leader>dc', exts.dap.configurations, { desc = "DAP - see configurations" })
    vim.keymap.set('n', '<leader>dd', dap.clear_breakpoints, { desc = "DAP - clear breakpoints" })
    vim.keymap.set('n', '<leader>dl', exts.dap.list_breakpoints, { desc = "DAP -  list breakpoints" })
    vim.keymap.set('n', '<leader>df', exts.dap.frames, { desc = "DAP - open frames" })
  end
}
