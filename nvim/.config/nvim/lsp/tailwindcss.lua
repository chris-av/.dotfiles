local proj_files = {
  'tailwind.config.js', 'tailwind.config.ts', 'tailwind.config.cjs',
  'postcss.config.js', 'postcss.config.ts', 'postcss.config.cjs'
}

return {
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

  root_dir = require("utils.helpers").find_proj_root(proj_files),

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
    },
  },
}
