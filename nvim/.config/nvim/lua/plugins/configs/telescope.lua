return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    "sharkdp/fd",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<Esc>"] = actions.close,

            -- git stuff
            ["<C-s>"] = actions.cycle_previewers_next,
            ["<C-a>"] = actions.cycle_previewers_prev,

          },
        },
        preview = {
          filesize_limit = 0.5, -- MB
        },
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
            },
          },
        },
        colorscheme = {
          enable_preview = true,
        },
      },
    })
  end
}
