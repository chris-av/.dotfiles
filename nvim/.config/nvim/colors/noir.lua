vim.cmd("hi clear")
vim.g.colors_name = "noir"

local snazzy = require("_themes.noir")
local highlight_groups = snazzy.highlight_groups

local function set_hl(hl_group, highlights)
  vim.api.nvim_set_hl(0, hl_group, highlights)
end

for group, val in pairs(highlight_groups) do
  set_hl(group, val)
end
