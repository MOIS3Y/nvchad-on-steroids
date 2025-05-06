--! -- -- -- default mappings -- -- -- !-- 
require "nvchad.mappings"

--! -- -- -- custom mappings -- -- -- !-- 
local map = vim.keymap.set
local wk = require("which-key")

--! -- -- -- common -- -- -- !-- 
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

--! -- -- -- nvzone/menu -- -- -- !-- 
-- keyboard users
map("n", "<C-t>", function()
    require("menu").open("default")
  end, { desc = "Open menus" }
)
-- mouse users + nvimtree users
map({ "n", "v" }, "<RightMouse>", function()
  require('menu.utils').delete_old_menus()
  vim.cmd.exec '"normal! \\<RightMouse>"'
  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
  end, { desc = "Open menus by right mouse click"}
)

--! -- -- -- nvzone/minty -- -- -- !-- 
wk.add({ "<leader>ms", function()
    require("minty.shades").open()
  end,
  desc = "Open minty shades tool",
  icon = { icon = "", color = "green" },
})
wk.add({ "<leader>mh", function()
    require("minty.huefy").open()
  end,
  desc = "Open minty huefy tool",
  icon = { icon = "", color = "green" },
})
