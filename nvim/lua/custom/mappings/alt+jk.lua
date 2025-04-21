local map = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Alt + j to move the current line/selection down
map("n", "<A-j>", ":m+1<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)

-- Alt + k to move the current line/selection up
map("n", "<A-k>", ":m-2<CR>==", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
