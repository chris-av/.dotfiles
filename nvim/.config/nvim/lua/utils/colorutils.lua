local M = {}


local std_path = "lualine.themes."            -- import path to themes from lualine package
local custom_path = "utils.lualine-themes."   -- import path for my own custom themes

M.theme_table = {
  ["Material Deep Ocean"] = { colorscheme = "material", lualine_theme = "auto" },
  ["Catppuccin Frappe"] = { colorscheme = "catppuccin-frappe", lualine_theme = "auto" },
  ["Catppuccin Latte"] = { colorscheme = "catppuccin-latte", lualine_theme = "auto" },
  ["Catppuccin Macchiato"] = { colorscheme = "catppuccin-macchiato", lualine_theme = "auto" },
  ["Catppuccin Mocha"] = { colorscheme = "catppuccin-mocha", lualine_theme = "auto" },
  ["Embark"] = { colorscheme = "embark", lualine_theme = custom_path .. "embark" },
  ["Grey"] = { colorscheme = "grey", lualine_theme = "auto" },
  ["Gruvbox"] = { colorscheme = "gruvbox", lualine_theme = std_path .. "gruvbox" },
  ["Matrix"] = { colorscheme = "matrix", lualine_theme = custom_path .. "matrix" },
  ["Dark"] = { colorscheme = "dark", lualine_theme = std_path .. "material" },
  ["Snazzy"] = { colorscheme = "snazzy", lualine_theme = std_path .. "material" },
}

M.set_colorscheme = function()
  local term_prof = os.getenv('TERM_PROFILE') or os.getenv('ITERM_PROFILE')
  if (term_prof == nil) then
    vim.cmd " colorscheme dark "
    return
  else
    local theme = M.theme_table[term_prof]
    if theme == nil then
      return
    end
    local colorscheme = theme.colorscheme
    vim.cmd(" colorscheme " .. colorscheme)
    return
  end
end

M.get_lualine_theme_path = function()
  local term_prof = os.getenv('TERM_PROFILE') or os.getenv('ITERM_PROFILE')
  if (term_prof == nil) then
    return "utils.lualine-themes.auto"
  else
    local theme = M.theme_table[term_prof]
    if theme == nil then
      print('could not find theme for : ' .. term_prof)
      print("defaulting to 'auto' for lualine")
      return "utils.lualine-themes.auto"
    end
    local lualine_theme = theme.lualine_theme
    if lualine_theme == nil then
      print('could not find lualine theme for : ' .. theme)
      print("defaulting to 'auto' for lualine")
      return "utils.lualine-themes.auto"
    end
    return lualine_theme
  end
end


return M
