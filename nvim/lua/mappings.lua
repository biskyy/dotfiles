require "nvchad.mappings"

require "custom.mappings.alt+jk"
require "custom.mappings.selection-to-search"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
