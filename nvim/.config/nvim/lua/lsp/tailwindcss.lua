local on_attach = require('lsp.on_attach')
local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)




nvim_lsp['tailwindcss'].setup {
  on_attach = on_attach,
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "javascript", "javascriptreact",
    "typescript", "typescriptreact",

    "aspnetcorerazor", "astro", "astro-markdown",
    "blade", "django-html", "htmldjango", "edge", "eelixir",
    "elixir", "ejs", "erb", "eruby", "gohtml", "haml",
    "handlebars", "hbs", "html", "html-eex", "heex", "jade",
    "leaf", "liquid", "markdown", "mdx", "mustache", "njk",
    "nunjucks", "php", "razor", "slim", "twig",
    "css", "less", "postcss", "sass", "scss",
    "stylus", "sugarss", "reason",
    "rescript", "vue", "svelte"
  },

  root_dir = nvim_lsp.util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'tailwind.config.cjs',
                                        'postcss.config.js', 'postcss.config.ts', 'postcss.config.cjs'),

  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "classList", "ngClass" },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwinddirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
      validate = true,
    }
  }


}

