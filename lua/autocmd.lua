local autocmd = vim.api.nvim_create_autocmd


-- show Nvdash when all buffers are closed
autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})

-- fix toggle comment for vala and blueprint
autocmd("FileType", {
  pattern = { "vala", "blueprint" },
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})