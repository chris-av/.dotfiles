hi clear
set background=dark
set termguicolors

" how do I set a variable here?
let s:yellow = "#f3f89c"
let s:red = "#fe5b56"
let s:magenta = "#fe69c0"
let s:cyan = "#9aecfd"
let s:grey = "#686767"
let s:orange = "#ffaf00"
let s:black = "#000000"
let s:blue = "#0000ff"

let s:foreground = "#efefea"
let s:background = "#282935"
let s:selection_fg = "#000000"
let s:selection_bg = "#92bbd0"


execute "hi Normal guifg=" . s:foreground
execute "hi NormalFloat guifg=" . s:foreground " guibg=#282828"
execute "hi Visual guifg=" . s:selection_fg " guibg=" . s:selection_bg
execute "hi Directory guifg=" . s:foreground
execute "hi IncSearch guifg=" . s:background " guibg=" . s:foreground
execute "hi Search guifg=" . s:background " guibg=" . s:foreground . " gui=bold"
execute "hi Substitute guifg=" . s:foreground
execute "hi MatchParen guifg=" . s:foreground
execute "hi ModeMsg guifg=" . s:foreground
execute "hi MoreMsg guifg=" . s:foreground
execute "hi NonText guifg=" . s:foreground
execute "hi LineNr guifg=" . s:yellow
" execute "hi CursorLine guifg=" . s:'' "guibg=" . s:''
execute "hi CursorLineNr guifg=" . s:yellow . " gui=bold"
execute "hi StatusLine guifg=" . s:orange . " guibg=" . s:selection_fg
execute "hi StatusLineNC guifg=" . s:foreground
execute "hi WinSeparator guifg=" . s:foreground
execute "hi SignColumn guifg=" . s:foreground
execute "hi Colorcolumn guifg=" . s:foreground
execute "hi TabLineFill guifg=" . s:foreground
execute "hi TabLine guifg=" . s:foreground
execute "hi TabLineSel guifg=" . s:foreground
execute "hi Pmenu guifg=" . s:foreground " guibg=" . s:background
execute "hi PmenuSel guifg=" . s:background " guibg=" . s:foreground
execute "hi PmenuSbar guifg=" . s:foreground
execute "hi Conceal guifg=" . s:foreground
execute "hi Title guifg=" . s:foreground
execute "hi Question guifg=" . s:foreground
execute "hi SpecialKey guifg=" . s:foreground
execute "hi WildMenu guifg=" . s:background . " guibg=" . s:orange . " gui=bold"
execute "hi Folded guifg=" . s:foreground
execute "hi FoldColumn guifg=" . s:foreground

" Syntax
execute "hi Boolean guifg=" . s:foreground
execute "hi Character guifg=" . s:foreground
execute "hi Comment guifg=" . s:grey
execute "hi Conditional guifg=" . s:yellow
execute "hi Constant guifg=" . s:magenta
execute "hi Define guifg=" . s:foreground
execute "hi Delimiter guifg=" . s:foreground
execute "hi Float guifg=" . s:foreground
execute "hi Function guifg=" . s:orange
execute "hi Identifier guifg=" . s:yellow
execute "hi Include guifg=" . s:yellow
execute "hi Keyword guifg=" . s:yellow
execute "hi Label guifg=" . s:foreground
execute "hi Number guifg=" . s:foreground
execute "hi Operator guifg=" . s:yellow
execute "hi PreProc guifg=" . s:foreground
execute "hi Repeat guifg=" . s:yellow
execute "hi Special guifg=" . s:yellow
execute "hi SpecialChar guifg=" . s:foreground
execute "hi Statement guifg=" . s:yellow
execute "hi StorageClass guifg=" . s:foreground
execute "hi String guifg=" . s:magenta
execute "hi Structure guifg=" . s:yellow
execute "hi Tag guifg=" . s:foreground
execute "hi Todo guifg=" . s:foreground
execute "hi Type guifg=" . s:yellow
execute "hi Typedef guifg=" . s:foreground

" Diff
execute "hi DiffAdd guifg=" . s:black . " guibg=#00d7ff"
execute "hi DiffAdded guifg=" . s:yellow
execute "hi DiffDelete guifg=" . s:foreground . " guibg=" . s:red
execute "hi DiffRemoved guifg=" . s:foreground . " guibg=" . s:red
execute "hi DiffChange guifg=" . s:cyan
execute "hi DiffText guifg=" . s:foreground
execute "hi DiffLine guifg=" . s:foreground
