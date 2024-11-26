-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  "bashls",
  "cssls",
  "docker_compose_language_service",  -- :set filetype=yaml.docker-compose
  "dockerls",
  "jsonls",
  "html",
  "nixd",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- html
lspconfig.emmet_language_server.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "htmldjango",
    "less",
    "sass",
    "scss",
    "pug",
    "typescriptreact",
    "vue"
  },
}

-- typescript
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        -- it's a hack for nixOS /nix/store/
        location = vim.fs.joinpath(
          vim.fs.dirname(
            vim.fs.dirname(
              vim.fn.system(
                'echo -n $(readlink -f $(which vue-language-server))'
              )
            )
          ),
          'lib/node_modules/@vue/language-server'
        ),
        --
        languages = { 'vue' },
      },
    },
  },
  filetypes = {
    'typescript',
    'javascript',
    'javascriptreact',
    'typescriptreact',
    'vue'
  },
}

--python
lspconfig.pylsp.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  configurationSources = { 'flake8' },
  settings = {
    plugins = {
      flake8 = {
        enabled = true,
        maxLineLength = 80,
      },
      pycodestyle = { enabled = false },
      pyflakes = { enabled = false },
      pylint = { enabled = false },
      mccabe = { enabled = false },
    },
  }
}