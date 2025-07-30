require "nvchad.options"

require "custom.save-n-load-views"
require "custom.exit-snippets-on-mode-changed"

local o = vim.o
local g = vim.g

o.relativenumber = true

o.scrolloff = 15

o.shiftwidth = 2
o.tabstop = 2

g.rust_recommended_style = 0

g.inlay_hints_visible = true

-- o.cursorlineopt ='both' -- to enable cursorline!
