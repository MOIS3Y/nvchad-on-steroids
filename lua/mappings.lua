--! -- -- -- default mappings -- -- -- !-- 
require "nvchad.mappings"

--! -- -- -- custom mappings -- -- -- !-- 
local map = vim.keymap.set
local wk = require "which-key"
local gitsigns = require "gitsigns"

--! -- -- -- common -- -- -- !-- 
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

--! -- -- -- nvzone/menu -- -- -- !-- 
-- keyboard users
map("n", "<C-t>", function()
    require("menu").open("default")
  end, { desc = "menu open" }
)
-- mouse users + nvimtree users
map({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()
  vim.cmd.exec '"normal! \\<RightMouse>"'
  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
  end, { desc = "menu open by right mouse click"}
)

--! -- -- -- nvzone/minty -- -- -- !-- 
wk.add({"<leader>ms", function()
    require("minty.shades").open()
  end,
  mode = "n",
  icon = { icon = "", color = "green" },
  desc = "minty open shades tool",
})
wk.add({"<leader>mh", function()
    require("minty.huefy").open()
  end,
  mode = "n",
  icon = { icon = "", color = "green" },
  desc = "minty open huefy tool",
})

--! -- -- -- gitsigns -- -- -- !--
-- navigation
map("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal({"]c", bang = true})
  else
    gitsigns.nav_hunk("next")
  end
end, { desc = "git go to the next change" })

map("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal({"[c", bang = true})
  else
    gitsigns.nav_hunk("prev")
  end
end, { desc = "git go to the prev change "})
-- gitsigns submenu
wk.add({
  {"<leader>gh", group = " git hunks", icon = { icon = "󰡎", color = "cyan" } },
  {"<leader>gb", group = " git blame", icon = { icon = "󰊤", color = "cyan" } },
})
-- actions
map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "git stage hunk" })
map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "git reset hunk" })
map("v", "<leader>ghs", function()
  gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "git stage hunk" })
map("v", "<leader>ghr", function()
  gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "git reset hunk" })
map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "git stage buffer" })
map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "git reset buffer" })
map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "git preview hunk" })
map("n", "<leader>ghi",
  gitsigns.preview_hunk_inline,
  { desc = "git preview hunk inline" }
)
map("n", "<leader>gbf", function()
  gitsigns.blame_line({ full = true })
end, { desc = "git blame line full" }
)
map("n", "<leader>ghd", gitsigns.diffthis, { desc = "git diff this" })
map("n", "<leader>ghD", function()
  gitsigns.diffthis("~")
end, { desc = "git diff this ~" }
)
map("n", "<leader>ghq", gitsigns.setqflist, { desc = "git set quick fix list" })
map("n", "<leader>ghQ", function() 
  gitsigns.setqflist("all")
end, { desc = "git set quick fix list all" }
)
-- toggles
map("n", "<leader>gbt",
  gitsigns.toggle_current_line_blame,
  { desc = "toggle current line blame" }
)
map("n", "<leader>gbw",
  gitsigns.toggle_word_diff,
  { desc = "toggle word diff" }
)
