return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "kanagawa",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true},
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }

    -- gpt-commit-msg
    vim.g.gpt_commit_msg = vim.empty_dict()
    vim.g.gpt_commit_msg.api_key = vim.fn.getenv("OPENAI_API_KEY")
    vim.g.copilot_filetypes = { gitcommit = true }
    -- vim-sandwich
    vim.g['sandwich#recipes'] = {}
    table.insert(vim.g['sandwich#recipes'], {
      external = { 'it', 'at' },
      noremap = 1,
      filetype = { 'html' },
      input = { 't' },
    })

    -- auto gpt-commit
    vim.cmd([[
    augroup GptCommitMsg
        autocmd!
        autocmd VimEnter * let g:gpt_commit_msg = get(g:, 'gpt_commit_msg', {}) | let g:gpt_commit_msg['api_key'] = $OPENAI_API_KEY
    augroup END
    ]])

    vim.api.nvim_command('command! Test execute "!cargo compete test "..expand("%:t:r")')
    vim.api.nvim_command('command! Submit execute "!cargo compete submit "..expand("%:t:r")')
    vim.api.nvim_command('command! Open execute "!cargo compete open "..expand("%:t:r")')
    -- set filetype for .satysfi
    vim.cmd [[
      autocmd BufRead,BufNewFile *.saty set filetype=satysfi
      autocmd BufWritePost *.saty silent !satysfi % > /dev/null
    ]]
  end,
}
