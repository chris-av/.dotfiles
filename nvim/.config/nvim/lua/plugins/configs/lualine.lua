return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "SmiteshP/nvim-navic",
  },
  config = function()
    local navic = require("nvim-navic")
    local lualine = require("lualine")
    local themes = require("_themes")

    -- use env var
    local theme_name = os.getenv("TERM_PROFILE") or os.getenv("ITERM_PROFILE")
    if (theme_name == nil) then
      theme_name = "habamin"
    end

    -- get the lualine config based on current theme
    local theme = themes[theme_name]
    local lualine_config
    local default_theme = require("_themes._defaults")

    if theme == nil then
      lualine_config = default_theme.lualine
    else
      lualine_config = theme.lualine
    end

    navic.setup({
      icons = {
        File          = "󰈙 ",
        Module        = " ",
        Namespace     = "󰌗 ",
        Package       = " ",
        Class         = "󰌗 ",
        Method        = "󰆧 ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "󰕘",
        Interface     = "󰕘",
        Function      = "󰊕 ",
        Variable      = "󰆧 ",
        Constant      = "󰏿 ",
        String        = "󰀬 ",
        Number        = "󰎠 ",
        Boolean       = "◩ ",
        Array         = "󰅪 ",
        Object        = "󰅩 ",
        Key           = "󰌋 ",
        Null          = "󰟢 ",
        EnumMember    = " ",
        Struct        = "󰌗 ",
        Event         = " ",
        Operator      = "󰆕 ",
        TypeParameter = "󰊄 ",
      }
    })

    -- now call lualine, and extend it with gps
    lualine.setup({
      options = {
        theme = lualine_config.theme,
        component_separators = { left = ' ', right = '  ' },
      },
      sections = lualine_config.components,
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { { 'filename', path = 1 } }
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { { 'filename', path = 1 } }
      },
      tabline = {},
      extensions = {}
    })
  end
}
