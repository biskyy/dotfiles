local map = vim.keymap.set

-- masterfully crafted by chatgpt

-- Helper: Escape regex characters for Vim search
local function escape_regex(text)
  return vim.fn.escape(text, "/\\.^$*~[]")
end

-- Helper: Convert text into search pattern with \<word\> boundaries
local function wordify_pattern(text)
  -- local pattern = {}
  -- local i = 1
  -- while i <= #text do
  --   local word_start, word_end = text:find("%w+", i)
  --   if word_start then
  --     -- Add non-word chars before word
  --     if word_start > i then
  --       table.insert(pattern, text:sub(i, word_start - 1))
  --     end
  --     -- Add word with word boundaries
  --     local word = text:sub(word_start, word_end)
  --     table.insert(pattern, "\\<" .. word .. "\\>")
  --     i = word_end + 1
  --   else
  --     -- Add any remaining non-word characters
  --     table.insert(pattern, text:sub(i))
  --     break
  --   end
  -- end
  -- return table.concat(pattern)

  -- Wrap each word with \< \>
  -- Leave everything else (punctuation, etc.) untouched
  return text:gsub("(%w+)", "\\<%1\\>")
end

-- Main mapping
vim.keymap.set("v", "//", function()
  local saved_reg = vim.fn.getreg '"'
  vim.cmd 'normal! "zy' -- Yank selection into "z
  local text = vim.fn.getreg "z"

  local escaped = escape_regex(text)
  local pattern = wordify_pattern(escaped)

  vim.fn.setreg("/", pattern)
  vim.cmd "normal! n"
  vim.cmd "normal! N"
  vim.fn.setreg('"', saved_reg)
end, { noremap = true, silent = true })
