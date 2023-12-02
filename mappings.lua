-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },

    -- ToggleTerm
    ["<leader>th"] = { "<cmd>ToggleTerm size=20 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
    ["<leader>tv"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" },

    -- Overseer
    ["<leader>:"] = { name = "Overseer" },
    ["<leader>::"] = { "<cmd>OverseerRun<cr>", desc = "OverseerRun" },
    ["<leader>:c"] = { "<cmd>OverseerClearCache<cr>", desc = "OverseerClearCache" },
    ["<leader>:o"] = { "<cmd>OverseerOpen<cr>", desc = "OverseerOpen" },
    ["<leader>:t"] = { "<cmd>OverseerToggle<cr>", desc = "OverseerToggle" },
    ["<leader>:i"] = { "<cmd>OverseerInfo<cr>", desc = "OverseerInfo" },
    ["<leader>:l"] = { "<cmd>OverseerRestartLast<cr>", desc = "OverseerRestartLast" },

    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  i = {
    -- Better escape
    ["kj"] = { "<esc>" },
  },
  v = {
    -- Better escape
    ["jk"] = { "<esc>" },
    ["kj"] = { "<esc>" },

    -- Quick shift
    ["<"] = { "<gv" },
    [">"] = { ">gv" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<esc>"] = { "<C-\\><C-n>" },
    ["jk"] = { "<C-\\><C-n>" },
    ["kj"] = { "<C-\\><C-n>" },
    ["<C-h>"] = { "<cmd>wincmd h<cr>" },
    ["<C-j>"] = { "<cmd>wincmd j<cr>" },
    ["<C-k>"] = { "<cmd>wincmd k<cr>" },
    ["<C-l>"] = { "<cmd>wincmd l<cr>" },
    ["<C-w>"] = { "<C-\\><C-n><C-w>" },
    ["<C-Up>"] = { "<cmd>resize +2<cr>" },
    ["<C-Down>"] = { "<cmd>resize -2<cr>" },
    ["<C-Left>"] = { "<cmd>vertical resize +2<cr>" },
    ["<C-Right>"] = { "<cmd>vertical resize -2<cr>" },
  },
}
