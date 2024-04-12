local status_ok, telescope = pcall(require, 'telescope')
local notifications = require('utils.notifications')
if not status_ok then
  notifications.plugin_error('telescope')
  return
end


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
  },
})
