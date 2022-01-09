-- basic highlights
vim.cmd([[ highlight Pmenu ctermfg=black ctermbg=DarkGreen guifg=black guibg=LightGreen ]])
vim.cmd([[ highlight PmenuSel ctermfg=white ctermbg=DarkGreen guifg=white guibg=LightGreen ]])
vim.cmd([[ highlight NormalFloat ctermfg=white ctermbg=black guifg=white guibg=black ]])
vim.cmd([[ highlight FloatBorder ctermfg=white ctermbg=black guifg=white guibg=black ]])
-- vim.cmd([[ highlight NormalFloat ctermbg=black ]])
-- vim.cmd([[ highlight NormalFloat ctermbg=black ]])
vim.cmd([[ highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE ]])
vim.cmd([[ highlight LineNr ctermbg=NONE guibg=NONE guifg=LightGreen ]])
vim.cmd([[ highlight CursorLineNR cterm=bold gui=bold ]])
vim.cmd([[ highlight VertSplit ctermbg=DarkGreen ctermfg=black ctermbg=black guifg=black guibg=black ]])


-- diagnostics
vim.cmd([[hi DiagnosticsError ctermfg=red]])
vim.cmd([[hi DiagnosticHint ctermfg=blue]])
vim.cmd([[hi DiagnosticsWarning ctermfg=yellow]])
vim.cmd([[hi DiagnosticsInformation ctermfg=yellow]])


-- vim-signify
vim.cmd([[ highlight SignifySignAdd ctermfg=green guifg=#00ff00 cterm=NONE gui=NONE ]])
vim.cmd([[ highlight SignifySignDelete ctermfg=red guifg=#00ff00 cterm=NONE gui=NONE ]])
vim.cmd([[ highlight SignifySignChange ctermfg=yellow guifg=#00ff00 cterm=NONE gui=NONE ]])


