require "nvchad.options"


local blink_all = "blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.gcr = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:" .. blink_all

