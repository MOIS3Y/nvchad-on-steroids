local configs = require "nvchad.configs.lspconfig"

local servers = {
  -- bash
  bashls = {
    settings = {
      bashIde = {
        globPattern = "*@(.sh|.inc|.bash|.command)"
      },
    },
  },
  -- docker
  docker_compose_language_service = {},  -- :set filetype=yaml.docker-compose
  dockerls = {
    docker = {
	    languageserver = {
	      formatter = { ignoreMultilineInstructions = true },
	    },
    },
  },
  -- html  
  emmet_language_server = {},
  -- nix
  nixd = {},
  -- python
  pylsp = {
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
    },
  },
  -- add more LSP servers here ...
}

-- load
for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end

