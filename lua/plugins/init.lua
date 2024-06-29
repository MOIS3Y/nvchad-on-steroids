return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        -- "dockerfile",
        "gitignore",
        "html",
        "ini",
        "javascript",
        "json",
        "htmldjango",
        "lua",
        "nix",
        "python",
        "requirements",
        "scss",
        "sql",
        "toml",
        "vim",
        "vimdoc",
        "yaml"
      },
    },
  },
  {
    "lukas-reineke/virt-column.nvim",
    opts = { char = "┊" }
  },
  {
  "m4xshen/smartcolumn.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "lukas-reineke/virt-column.nvim",
    },
    opts = {
      disabled_filetypes = {
        "netrw",
        "NvimTree",
        "Lazy",
        "help",
        "text",
        "markdown",
        "tex",
        "html",
      },
      scope = "file"
    },
  },
  -- add more here ...
}
