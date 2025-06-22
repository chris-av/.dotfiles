local M = {}
local themes = require("_themes")

M.theme_table = {
  ["material-deep-ocean"] = { colorscheme = "material", lualine_theme = "auto", },
  ["catppuccin-frappe"] = { colorscheme = "catppuccin-frappe", lualine_theme = "auto", },
  ["catppuccin-latte"] = { colorscheme = "catppuccin-latte", lualine_theme = "auto", },
  ["catppuccin-macchiato"] = { colorscheme = "catppuccin-macchiato", lualine_theme = "auto", },
  ["catppuccin-mocha"] = { colorscheme = "catppuccin-mocha", lualine_theme = "auto", },
  ["embark"] = { colorscheme = "embark", lualine_theme = themes["embark"].lualine, },
  ["grey"] = { colorscheme = "grey", lualine_theme = themes["grey"].lualine, },
  ["gruvbox"] = { colorscheme = "snazzy", lualine_theme = themes["snazzy"].lualine, },
  ["matrix"] = { colorscheme = "matrix", lualine_theme = themes["matrix"].lualine, },
  ["dark"] = { colorscheme = "dark", lualine_theme = require("lualine.themes.material"), },
  ["snazzy"] = { colorscheme = "snazzy", lualine_theme = require("lualine.themes.material"), },
  ["evil"] = { colorscheme = "evil", lualine_theme = "auto", },
  ["rose-pine"] = { colorscheme = "rose-pine-main", lualine_theme = "auto", },
  ["fluoromachine"] = { colorscheme = "fluoromachine", lualine_theme = themes["fluoromachine"].lualine, },
  ["habamin"] = { colorscheme = "habamin", lualine_theme = themes["habamin"].lualine, },
}

-- set colorscheme based on environment variable
-- if no colorscheme is detected for TERM_PROFILE or ITERM_PROFILE, 
-- then just use the dark theme
M.set_colorscheme = function()
  local term_prof = os.getenv('TERM_PROFILE') or os.getenv('ITERM_PROFILE')
  if (term_prof == nil) then
    vim.cmd("colorscheme habamax")
    return
  else
    term_prof = term_prof:lower()
    local theme = M.theme_table[term_prof]
    if theme == nil then
      return
    end
    local colorscheme = theme.colorscheme
    vim.cmd("colorscheme " .. colorscheme)
    return
  end
end

M.get_lualine_config = function(theme_name)
  local theme = M.theme_table[theme_name]
  if theme == nil then
    return {
      colorscheme = "auto",
      lualine_theme = themes["auto"]
    }
  end
  return theme
end

return M
