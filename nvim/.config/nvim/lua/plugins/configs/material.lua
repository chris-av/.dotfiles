return {
  "marko-cerovac/material.nvim",
  config = function()
    local material = require("material")
    vim.g.material_style = 'deep ocean'

    material.setup({
      disable = {
        colored_cursor = true,
      },
      custom_highlights = {
        DevIconTsx = { fg = 'LightBlue' },
        DevIconJsx = { fg = 'LightBlue' },

        NvimTreeFolderIcon = { fg = 'LightBlue' },
        NvimTreeGitNew = { fg = 'red' },
        NvimTreeGitDirty = { fg = 'LightGreen' },
        NvimTreeGitStaged = { fg = 'LightGreen' },
        GitSignsAdd = { fg = 'LightGreen', bg = 'none' },
        GitSignsChange = { fg = 'blue', bg = 'none' },
        GitSignsDelete = { fg = 'red', bg = 'none' },
      }
    })
  end
}
