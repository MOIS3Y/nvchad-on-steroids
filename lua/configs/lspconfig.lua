-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
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
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

--python
lspconfig.pylsp.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
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
