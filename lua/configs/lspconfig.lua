-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()


local servers = {
  -- with default options
  bashls = {},
  blueprint_ls = {},
  cssls = {},
  docker_compose_language_service = {},  -- :set filetype=yaml.docker-compose
  dockerls = {},
  jsonls = {},
  html = {},
  nixd = {},
  rust_analyzer = {},
  vala_ls = {},
  -- with custom options
  emmet_language_server = {
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
  },
  ts_ls = {
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
  },
  pylsp = {
    settings = {
      plugins = {
        ruff = {
          enable = true,
          formatEnabled = true,
          -- ignored when a pyproject.toml or ruff.toml is present
          lineLength = 79,
          select = {
            "E",  -- pycodestyle errors (PEP 8)
            "W",  -- pycodestyle warnings
            "F",  -- PyFlakes
            "I",  -- isort
            "UP"  -- pyupgrade
          },
          perFileIgnores = {
            ["__init__.py"] = "CPY001"
          },
        },
        flake8 = { enabled = false, },
        pycodestyle = { enabled = false },
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        mccabe = { enabled = false },
      },
    }
  },
  -- add more lsp servers here ...
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name)  -- nvim v0.11.0 or above required
  vim.lsp.config(name, opts) -- nvim v0.11.0 or above required
end