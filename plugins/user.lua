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
}
