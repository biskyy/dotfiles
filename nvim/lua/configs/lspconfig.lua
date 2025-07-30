local nvlsp = require "nvchad.configs.lspconfig"

nvlsp.defaults()

local servers = {
  html = {},
  cssls = {},
  clangd = {},
  rust_analyzer = {
    rustfmt = {
      extraArgs = { "--config", "tab_spaces=8" },
    },
    settings = {
      ["rust-analyzer"] = {},
    },
    -- on_attach = function(client, bufnr)
    --   vim.lsp.inlay_hint.enable(bufnr)
    -- end,
  },

  ts_ls = {
    init_options = {
      preferences = {
        importModuleSpecifierPreference = "non-relative",
      },
    },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name) -- nvim v0.11.0 or above required
  vim.lsp.config(name, opts) -- nvim v0.11.0 or above required
end
