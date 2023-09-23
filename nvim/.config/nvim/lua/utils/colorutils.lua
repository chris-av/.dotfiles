local M = {}


M.theme_table = {
  ["Material Deep Ocean"] = { colorscheme = "material", lualine_theme = "auto" },
  ["Catppuccin Frappe"] = { colorscheme = "catppuccin-frappe", lualine_theme = "auto" },
  ["Catppuccin Latte"] = { colorscheme = "catppuccin-latte", lualine_theme = "auto" },
  ["Catppuccin Macchiato"] = { colorscheme = "catppuccin-macchiato", lualine_theme = "auto" },
  ["Catppuccin Mocha"] = { colorscheme = "catppuccin-mocha", lualine_theme = "auto" },
  ["Embark"] = { colorscheme = "embark", lualine_theme = "auto" },
  ["Grey"] = { colorscheme = "grey", lualine_theme = "auto" },
  ["Matrix"] = { colorscheme = "matrix", lualine_theme = "auto" },
  ["Dark"] = { colorscheme = "dark", lualine_theme = "material" },
  ["Snazzy"] = { colorscheme = "snazzy", lualine_theme = "wombat" },
}

M.set_colorscheme = function()
  local term_prof = os.getenv('TERM_PROFILE')
  if (term_prof == nil) then
    vim.cmd " colorscheme dark "
    return
  else
    local colorscheme = M.theme_table[term_prof].colorscheme
    vim.cmd(" colorscheme " .. colorscheme)
    return
  end
end

M.get_lualine_theme = function()
  local term_prof = os.getenv('TERM_PROFILE')
  if (term_prof == nil) then
    return "auto"
  else
    local theme = M.theme_table[term_prof]
    local lualine_theme = theme.lualine_theme
    if lualine_theme == nil then
      print('could not find theme for : ' .. term_prof)
      print("defaulting to 'auto' for lualine")
      return "auto"
    end
    return lualine_theme
  end
end


return M
