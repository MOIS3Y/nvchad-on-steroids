return {
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
}
