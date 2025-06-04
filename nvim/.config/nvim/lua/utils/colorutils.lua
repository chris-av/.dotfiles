local M = {}


local std_path = "lualine.themes."            -- import path to themes from lualine package
local custom_path = "utils.lualine-themes."   -- import path for my own custom themes

M.theme_table = {
  ["material-deep-ocean"] = { colorscheme = "material", lualine_theme = "auto" },
  ["catppuccin-frappe"] = { colorscheme = "catppuccin-frappe", lualine_theme = "auto" },
  ["catppuccin-latte"] = { colorscheme = "catppuccin-latte", lualine_theme = "auto" },
  ["catppuccin-macchiato"] = { colorscheme = "catppuccin-macchiato", lualine_theme = "auto" },
  ["catppuccin-mocha"] = { colorscheme = "catppuccin-mocha", lualine_theme = "auto" },
  ["embark"] = { colorscheme = "embark", lualine_theme = custom_path .. "embark" },
  ["grey"] = { colorscheme = "grey", lualine_theme = "auto" },
  ["gruvbox"] = { colorscheme = "snazzy", lualine_theme = custom_path .. "gruvbox" },
  ["matrix"] = { colorscheme = "matrix", lualine_theme = custom_path .. "matrix" },
  ["dark"] = { colorscheme = "dark", lualine_theme = std_path .. "material" },
  ["snazzy"] = { colorscheme = "snazzy", lualine_theme = std_path .. "material" },
  ["evil"] = { colorscheme = "evil", lualine_theme = "auto" },
  ["rose-pine"] = { colorscheme = "rose-pine-main", lualine_theme = "auto" },
  ["fluoromachine"] = { colorscheme = "fluoromachine", lualine_theme = custom_path .. "fluoromachine", },
}

-- set colorscheme based on environment variable
-- if no colorscheme is detected for TERM_PROFILE or ITERM_PROFILE, 
-- then just use the dark theme
M.set_colorscheme = function()
  local term_prof = os.getenv('TERM_PROFILE') or os.getenv('ITERM_PROFILE')
  if (term_prof == nil) then
    vim.cmd " colorscheme dark "
    return
  else
    term_prof = term_prof:lower()
    local theme = M.theme_table[term_prof]
    if theme == nil then
      return
    end
    local colorscheme = theme.colorscheme
    vim.cmd(" colorscheme " .. colorscheme)
    return
  end
end

-- return local path to a lualine theme
--
-- lualine template: eg, lualine.themes.gruvbox
-- my config:        eg, utils.lualine-themes.gruvbox
-- auto              eg, auto
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
