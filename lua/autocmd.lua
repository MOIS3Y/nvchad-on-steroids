local autocmd = vim.api.nvim_create_autocmd

-- fix toggle comment for vala and blueprint
autocmd("FileType", {
  pattern = { "vala", "blueprint" },
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})
