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
    local builtins = require("telescope.builtin")

    local preview_colorschemes = function()
      builtins.colorscheme({ enable_preview = true, })
    end
    local curr_buff_srch = function()
      local themes = require('telescope.themes')
      local previewer = themes.get_dropdown({ previewer = false })
      builtins.current_buffer_fuzzy_find(previewer)
    end

    vim.keymap.set('n', '<leader>km', builtins.keymaps, { desc = "list keymappings" })
    vim.keymap.set('n', '<leader>co', preview_colorschemes, { desc = "list colorschemes" })
    vim.keymap.set('n', '<leader>hi', builtins.highlights, { desc = "list highlights" })
    vim.keymap.set('n', '<leader>ff', builtins.find_files, { desc = "find files" })
    vim.keymap.set('n', '<leader>gc', builtins.git_commits, { desc = "list git commits" })
    vim.keymap.set('n', '<leader>/', curr_buff_srch, { desc = "find in current buffer" })
    vim.keymap.set('n', '<leader>gg', builtins.live_grep, { desc = "live grep" })
    vim.keymap.set('n', '<leader>lb', builtins.buffers, { desc = "list buffers" })
    vim.keymap.set('n', '<leader>?', builtins.help_tags, { desc = "help tags" })
    vim.keymap.set('n', '<leader>ml', builtins.marks, { desc = "list marks" })

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
        marks = {
          attach_mappings = function(bufnr, map)
            map("i", "<C-d>", function()
              require("telescope.actions").delete_mark(bufnr)
            end)
            return true
          end,
        },
        colorscheme = {
          enable_preview = true,
        },
      },
    })
  end
}
