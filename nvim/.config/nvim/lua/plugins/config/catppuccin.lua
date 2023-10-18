local status_ok, catppuccin = pcall(require, 'catppuccin')
local notifications = require('utils.notifications')
if not status_ok then
  notifications.plugin_error('catppuccin')
  return
end


-- flavours include dusk, latte, frappe, macchiato, mocha
local iterm_profile = os.getenv('ITERM_PROFILE')

if (iterm_profile == nil) then
  -- if not using iterm, just setup catpuccin but don't define flavor yet
  return
end

if (string.match(iterm_profile, 'Catppuccin')) then

  if (string.match(iterm_profile, 'Frappe')) then
    vim.g.catppuccin_flavour = "frappe"
  end

  if (string.match(iterm_profile, 'Latte')) then
    vim.g.catppuccin_flavour = "latte"
  end
  
  if (string.match(iterm_profile, 'Macchiato')) then
    vim.g.catppuccin_flavour = "macchiato"
  end
  
  if (string.match(iterm_profile, 'Mocha')) then
    vim.g.catppuccin_flavour = "mocha"
  end
  
else

  vim.g.catppuccin_flavour = "mocha"
  
end


catppuccin.setup({
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  transparent_background = false,
  term_colors = false,
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin",
    suffix = "_compiled"
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    coc_nvim = false,
    lsp_trouble = false,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    neotree = {
      enabled = false,
      show_root = true,
      transparent_panel = false,
    },
    dap = {
      enabled = false,
      enable_ui = false,
    },
    which_key = false,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = false,
    notify = true,
    telekasten = true,
    symbols_outline = true,
    mini = false,
  },
  custom_highlights = {
    Folded = { bg = 'none' },
    UfoFoldedBg = { bg = 'none' },
    DevIconTsx = { fg = '#20c2e3' },
    DevIconJsx = { fg = '#20c2e3' },
  }
})

