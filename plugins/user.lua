return {
  {
    "TimUntersberger/neogit",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    dependencies = {
      "sindrets/diffview.nvim",
    },
    config = function()
      require("neogit").setup {
        integrations = {
          diffview = true,
        },
      }
    end,
  },

  {
    "tpope/vim-surround",
    version = "*",
    event = "VeryLazy",
  },

  {
    "folke/todo-comments.nvim",
    versiont = "*",
    event = "VeryLazy",
  },

  {
    -- Denoでvimプラグインが動作するようになるやつ
    "vim-denops/denops.vim",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },

  {
    "vim-skk/skkeleton",
    lazy = false,
    dependencies = { "vim-denops/denops.vim" },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "skkeleton-initialize-pre",
        callback = function()
          vim.fn["skkeleton#config"] {
            eggLikeNewline = true,
            globalDictionaries = {
              "~/.config/eskk/SKK-JISYO.L",
            },
          }
        end,
      })
    end,
  },

  {
    "rhysd/clever-f.vim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "rhysd/git-messenger.vim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "ktakayama/gpt-commit-msg.vim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "simeji/winresizer",
    version = "*",
    event = "VeryLazy",
  },

  {
    "mg979/vim-visual-multi",
    version = "*",
    event = "VeryLazy",
  },

  {
    "kkoomen/vim-doge",
    version = "*",
    event = "VeryLazy",
  },

}
