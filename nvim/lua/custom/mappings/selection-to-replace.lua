local utils = require "custom.mappings.utils"

-- Escape for use in search pattern
local function escape_regex(text)
  return vim.fn.escape(text, "/\\.^$*~[]")
end

-- Wrap words with \< \>
local function wordify_pattern(text)
  return text:gsub("(%w+)", "\\<%1\\>")
end

-- Main mapping: start :%s/ command with escaped + wordified text
utils.map("v", "/r", function()
  vim.cmd 'normal! "zy' -- yank visual selection into register z
  local text = vim.fn.getreg "z"

  local escaped = escape_regex(text)
  local pattern = wordify_pattern(escaped)

  -- Open the command line with prefilled :%s/.../ (cursor after the second /)
  vim.api.nvim_feedkeys(":%s/" .. pattern .. "/", "n", false)
end, vim.tbl_extend("force", utils.default_opts, { desc = "replace all selected text with ..." }))
