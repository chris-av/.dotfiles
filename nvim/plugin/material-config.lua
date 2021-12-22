-- print('running setup!')
vim.g.material_style = 'deep ocean'

-- vim.cmd[[ set termguicolors ]] -- this variable must be enabled for colors to be applied properly
require('material').setup({
  custom_highlights = {
    NvimTreeFolderIcon = { fg = 'LightBlue' },
    NvimTreeGitNew = { fg = 'red' },
    NvimTreeGitDirty = { fg = 'LightGreen' },
    NvimTreeGitStaged = { fg = 'LightGreen' } 
  }
})


-- vim.cmd[[ highlight NvimTreeFolderIcon ctermfg=blue guifg=blue ]]
-- vim.cmd[[ highlight NvimTreeGitNew ctermfg=blue guifg=blue ]]
-- vim.cmd[[ highlight NvimTreeGitDirty ctermfg=red guifg=red ]]
-- vim.cmd[[ highlight NvimTreeGitStaged ctermfg=DarkGreen guifg=LightGreen ]]

-- manually set colorscheme
-- vim.cmd[[ colorscheme material ]]
vim.cmd[[ set guifont=Hack\ Nerd\ Font:h12 ]]

if vim.api.nvim_eval("exists('g:neovide')") == 1 then
  vim.cmd[[ colorscheme material ]]
end

