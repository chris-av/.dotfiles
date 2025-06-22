vim.cmd("hi clear")
vim.g.colors_name = "evil"

local evil = require("_themes.dark")
local highlight_groups = evil.highlight_groups

local function set_hl(hl_group, highlights)
  vim.api.nvim_set_hl(0, hl_group, highlights)
end

for group, val in pairs(highlight_groups) do
  set_hl(group, val)
end
