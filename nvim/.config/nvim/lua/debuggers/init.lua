require('telescope').load_extension('dap')
require('debuggers.python')
require('debuggers.node')
require('debuggers.dapui')


require('dap').set_log_level('DEBUG')



local signs = {
  DapBreakpoint = { icon = "", hl = { fg = "red", bg = "" }},
  DapStopped = { icon = "", hl = { fg = "red", bg = "" }},
  DapBreakpointCondition = { icon = "", hl = { fg = "orange", bg = "", bold = true }},
  DapBreakpointRejected = { icon = "", hl = { fg = "red", bg = "" }},
  DapLogPoint = { icon = "", hl = { fg = "cyan", bg = "" }},
}

for name, info in pairs(signs) do
  local icon = info.icon
  local fg = info.hl.fg
  local bg=  info.hl.bg
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
  vim.api.nvim_set_hl(0, name, { fg = fg, bg = bg })
end







