local status_ok, cmp = pcall(require, 'cmp')
local notifications = require('utils.notifications')
if not status_ok then
  notifications.plugin_error('cmp')
  return
end


local status_ok, luasnip = pcall(require, 'luasnip')
if not status_ok then
  notifications.plugin_error('luasnip')
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.replace
    }),

    ['<Tab>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() and luasnip.in_snippet() then
        luasnip.jump(1)
      -- elseif luasnip.expandable() then
      --   luasnip.expand()
      else
        fallback()
      end
    end, { "i", "s", "n" }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) and luasnip.in_snippet() then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s", "n" }),

    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'buffer',  keyword_length = 8 },
    { name = "emoji", },
    { name = "cmp_r" },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        vsnip = "[vsnip]",
        nvim_lua = "[Lua]",
        luasnip = "[luasnip]",
        latex_symbols = "[Latex]",
      })[entry.source.name]
      vim_item.kind = ({
        Text          = ' Text',
        Method        = '󰆧 Method',
        Function      = '󰊕 Function',
        Constructor   = ' Constructor',
        Field         = ' Field',
        Variable      = ' Variable',
        Class         = ' Class',
        Interface     = ' Interface',
        Module        = ' Module',
        Property      = ' Property',
        Unit          = ' Unit',
        Value         = '󰎠 Value',
        Enum          = ' Enum',
        Keyword       = ' Keyword',
        Snippet       = ' Snippet',
        Color         = ' Color',
        File          = ' File',
        Reference     = ' Reference',
        Folder        = ' Folder',
        EnumMember    = ' EnumMember',
        Constant      = ' Constant',
        Struct        = ' Struct',
        Event         = ' Event',
        Operator      = ' Operator',
        TypeParameter = ' TypeParameter',
      })[vim_item.kind]
      return vim_item
    end,
  },
})


require("cmp_r").setup()
