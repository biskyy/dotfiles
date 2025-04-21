return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "cpp",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = {},
    config = function()
      require("scrollEOF").setup()
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- for fold
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "luukvbaal/statuscol.nvim",
    },
    event = "BufRead",
    config = function()
      require "configs.ufo"
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      require "configs.statuscol"
    end,
  },

  -- for html
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    lazy = true,
    event = "VeryLazy",
  },

  -- fancy command line
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    config = function()
      require "configs.noice"
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `nui.mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  -- notifications
  {
    "rcarriga/nvim-notify",
    config = function()
      require "configs.notify"
    end,
  },

  -- smooth scroll
  -- {
  --   "declancm/cinnamon.nvim",
  --   config = function()
  --     require("cinnamon").setup()
  --   end,
  --   opts = {
  --     -- change default options here
  --     options = {
  --       mode = "window",
  --     },
  --   },
  -- },

  -- fix commenting in multi-comment types files(e.g React: JS + HTML/JSX)
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("nvim-ts-context-commentstring").setup()
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require "gitsigns"

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "git preview husk" })
      end,
    },
  },
}
