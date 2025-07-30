local utils = require "custom.mappings.utils"

utils.map(
  "n",
  "<C-w>a",
  vim.lsp.buf.code_action,
  vim.tbl_extend("force", utils.default_opts, { desc = "Show available code actions" })
)
