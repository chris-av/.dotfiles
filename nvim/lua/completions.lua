local cmp = require'cmp'

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
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
  },

  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    -- { name = 'nvim_lua' },
    -- { name = 'vsnip' },
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
                Method        = ' Method',
                Function      = ' Function',
                Constructor   = ' Constructor',
                Field         = ' Field',
                Variable      = ' Variable',
                Class         = ' Class',
                Interface     = 'ﰮ Interface',
                Module        = ' Module',
                Property      = ' Property',
                Unit          = ' Unit',
                Value         = ' Value',
                Enum          = ' Enum',
                Keyword       = ' Keyword',
                Snippet       = '﬌ Snippet',
                Color         = ' Color',
                File          = ' File',
                Reference     = ' Reference',
                Folder        = ' Folder',
                EnumMember    = ' EnumMember',
                Constant      = ' Constant',
                Struct        = ' Struct',
                Event         = ' Event',
                Operator      = 'ﬦ Operator',
                TypeParameter = ' TypeParameter',
            })[vim_item.kind]
            return vim_item
        end,
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
    },

})

require('nvim-autopairs').setup({
  enable_check_bracket_line = false
})

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})

require('telescope').setup {}

