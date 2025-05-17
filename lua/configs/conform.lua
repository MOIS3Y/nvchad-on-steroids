local options = {
  formatters_by_ft = {
    css = { "prettier" },
    html = { "prettier" },
    lua = { "stylua" },
    nix = { "nixfmt" },
    python = { "ruff_format" },
    rust = { "rustfmt", lsp_format = "fallback" },
    vala = { lsp_format = "always" },
  },
  format_on_save = false,
}

return options