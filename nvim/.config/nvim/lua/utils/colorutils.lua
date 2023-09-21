local M = {}


M.theme_table = {
  ["Material Deep Ocean"] = "material",
  ["Catppuccin Frappe"] = "catppuccin-frappe",
  ["Catppuccin Latte"] = "catppuccin-latte",
  ["Catppuccin Macchiato"] = "catppuccin-macchiato",
  ["Catppuccin Mocha"] = "catppuccin-mocha",
  ["Embark"] = "embark",
  ["Grey"] = "grey",
  ["Matrix"] = "matrix",
  ["Dark"] = "dark",
  ["Snazzy"] = "snazzy",
}

M.set_colorscheme = function()
  local term_prof = os.getenv('TERM_PROFILE')
  if (term_prof == nil) then
    vim.cmd " colorscheme dark "
    return
  else
    local colorscheme = M.theme_table[term_prof]
    vim.cmd(" colorscheme " .. colorscheme)
    return
  end
end


return M

