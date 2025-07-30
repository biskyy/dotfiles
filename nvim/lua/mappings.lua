require "nvchad.mappings"

local utils = require "custom.mappings.utils"

require "custom.mappings.alt+jk"
require "custom.mappings.selection-to-search"
require "custom.mappings.selection-to-replace"
require "custom.mappings.code-action"
require "custom.mappings.return-to-visual-after-indent"

utils.map("n", ";", ":", { desc = "CMD enter command mode" })
