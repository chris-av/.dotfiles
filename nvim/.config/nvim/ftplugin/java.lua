local jdtls = require("jdtls")
local helpers = require("utils.helpers")
local notify = require("utils.notifications")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local home = os.getenv("HOME")
local workspace_path = vim.fs.joinpath(home, ".local/share/java/workspaces/")
local config

if vim.fn.isdirectory(workspace_path) == 0 then
  notify.notify_warn("jdtls", "did not detect java workspace dir : " .. workspace_path)
  helpers.mkdir_p(workspace_path)
  notify.notify_info("jdtls", "did not detect java workspace dir : " .. workspace_path)
end

if vim.fn.has("mac") == 1 then
  config = "mac"
elseif vim.fn.has("unix") == 1 then
  config = "linux"
else
  notify.notify_err("jdtls", "did not detect java workspace dir : " .. workspace_path)
  return
end

local mason_dir = vim.fs.joinpath(home, ".local/share/nvim/mason")

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  notify.notify_err("jdtls", "could not resolve a root_dir")
  return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fs.joinpath(workspace_path, project_name)

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach({
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- ❗
    'java', -- or '/path/to/java21_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- ❗
    '-jar', vim.fs.joinpath(mason_dir, '/share/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar'),
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version


    -- ❗
    '-configuration', vim.fs.joinpath(mason_dir, 'packages/jdtls/config_' .. config),
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- ❗
    -- See `data directory configuration` section in the README
    '-data', workspace_dir,
  },

    -- ❗
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  --
  -- vim.fs.root requires Neovim 0.10.
  -- If you're using an earlier version, use: require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
  capabilities = capabilities,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
})
