-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    [";"] = { ":" },

    -- resize
    ["<C-r>"] = { ":WinResizerStartResize<cr>" },

    -- split
    ["<C-s>"] = { "<C-w>v", desc = "Split window vertically" },
    ["<C-t>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Toggle vertical terminal" },

    -- vim-visual-multi
    ["<A-k>"] = { "<cmd>call vm#commands#add_cursor_up(0, v:count1)<cr>" },
    ["<A-j>"] = { "<cmd>call vm#commands#add_cursor_down(0, v:count1)<cr>" },

    -- telescope
    ["<leader>gg"] = { "<cmd>Telescope git_commits<cr>", desc = "Find a commit history in current file" },
    ["<leader>gG"] = { "<cmd>Telescope git_bcommits<cr>", desc = "Find commit history in all files" },
    ["<leader>gn"] = { "<Cmd>Neogit<cr>", desc = "Neogit" },

    -- markdown-preview
    ["<leader>mp"] = { "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-f>"] = { "<C-g>U<ESC><S-a>" },
  },
  v = {
    -- visual mode key mapping
    ["J"] = { ":move '>+1<CR>gv-gv", desc = "Move lines of code up" },
    ["K"] = { ":move '<-2<CR>gv-gv", desc = "Move lines of code down" },
  }
}
