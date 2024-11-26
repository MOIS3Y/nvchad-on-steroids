-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  "bashls",
  "cssls",
  "docker_compose_language_service",  -- :set filetype=yaml.docker-compose
  "dockerls",
  "emmet_language_server",
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

-- typescript
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
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
