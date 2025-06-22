local M = {}
M.palette = {}
M.theme = {}
M.lualine = {
  theme = {
    command = {
      a = { bg = "#262335", fg = "#FF8B39", gui = "bold", },
      b = { bg = "#7f451c", fg = "#FF8B39", }
    },
    insert = {
      a = { bg = "#262335", fg = "#FFCC00", gui = "bold", },
      b = { bg = "#7f6600", fg = "#FFCC00" }
    },
    normal = {
      a = { bg = "#262335", fg = "#AF6DF9", gui = "bold", },
      b = { bg = "#57367c", fg = "#AF6DF9", },
      c = { bg = "#241B2F", fg = "#8BA7A7", },
    },
    replace = {
      a = { bg = "#262335", fg = "#FE4450", gui = "bold" },
      b = { bg = "#7f2228", fg = "#FE4450" }
    },
    visual = {
      a = { bg = "#262335", fg = "#61E2FF", gui = "bold" },
      b = { bg = "#30717f", fg = "#61E2FF" }
    }
  },
  components = {
    lualine_a = { "mode" },
    lualine_b = {
      { "branch", icon = " " },
      "diff",
    },
    lualine_c = { "diagnostics", "navic", },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "" },
    lualine_z = { "location" }
  },
}

return M
