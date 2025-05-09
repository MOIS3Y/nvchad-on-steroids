-- highlight current indent line
-- https://github.com/lukas-reineke/indent-blankline.nvim/issues/649

return {
  "echasnovski/mini.indentscope",
  version = false,
  event = "User FilePost",
  opts = {
    symbol = "╎",
    options = { try_as_border = true,},
  },
  config = function(_, opts)
    require('mini.indentscope').setup(opts)
  end,
}
