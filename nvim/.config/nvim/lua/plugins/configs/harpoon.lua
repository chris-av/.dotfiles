return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").load_extension("harpoon")
    local harpoon = require("harpoon")
    local notify = require("utils.notifications")

    harpoon:setup({})

    local harpoon_add = function()
      local curr_buff = vim.api.nvim_buf_get_name(0)
      local show_file_path = vim.fn.fnamemodify(curr_buff, ":.")
      harpoon:list():add()
      notify.notify_info("harpoon", "added " .. show_file_path .. " to harpoon")
    end

    local toggle_opts = {
      border = "rounded",
      title_pos = "center",
      title = "Harpoon",
      ui_max_width = 65
    }

    vim.keymap.set('n', '<S-l>', function() harpoon:list():next() end, { desc = "next buffer" })
    vim.keymap.set('n', '<S-h>', function() harpoon:list():prev() end, { desc = "previous buffer" })
    vim.keymap.set('n', '<leader>i', harpoon_add, { desc = "add file to harpoon" })
    vim.keymap.set('n', '<leader>ll', function()
      harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
    end, { desc = "open harpoon window" })
  end
}
