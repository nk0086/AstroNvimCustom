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
    "machakann/vim-sandwich",
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
    "vim-skk/eskk.vim",
    lazy = false,
    init = function()
      vim.api.nvim_command("let g:eskk#directory = '~/.config/eskk'")
      vim.api.nvim_command("let g:eskk#egglike_newline = 1")
      vim.api.nvim_command("let g:eskk#global_dictionaries = ['~/.config/eskk/SKK-JISYO.L']")
      vim.api.nvim_command(
        "let g:eskk#dictionary = { 'path': g:eskk#directory.'/my_jisyo', 'sorted': 1, 'encoding': 'utf-8',}")
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

  {
    "mattn/emmet-vim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "ToruNiina/satysfi.vim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "fatih/vim-go",
    version = "*",
    event = "VeryLazy",
  },

  {
    "nvim-telescope/telescope-media-files.nvim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "nvim-lua/popup.nvim",
    version = "*",
    event = "VeryLazy",
  },

  {
    "iberianpig/tig-explorer.vim",
    version = "*",
    event = "VeryLazy",
  },
  
}
