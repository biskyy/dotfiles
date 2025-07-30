local utils = require "custom.mappings.utils"

-- Alt + j to move the current line/selection down
utils.map("n", "<A-j>", ":m+1<CR>==", utils.default_opts)
utils.map("v", "<A-j>", ":m '>+1<CR>gv=gv", utils.default_opts)

-- Alt + k to move the current line/selection up
utils.map("n", "<A-k>", ":m-2<CR>==", utils.default_opts)
utils.map("v", "<A-k>", ":m '<-2<CR>gv=gv", utils.default_opts)
