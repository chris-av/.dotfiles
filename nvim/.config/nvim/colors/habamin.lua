vim.cmd("hi clear")
vim.g.colors_name = "habamin"

local habamin = require("_themes.habamin")
local highlight_groups = habamin.highlight_groups

local function set_hl(hl_group, highlights)
  vim.api.nvim_set_hl(0, hl_group, highlights)
end

for group, val in pairs(highlight_groups) do
  set_hl(group, val)
end
