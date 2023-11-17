-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
return {
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

  -- notify
  require("notify").setup {
    background_colour = "#000000",
  },

  -- norg
  vim.api.nvim_create_user_command("Note", function()
    vim.cmd "cd ~/notes"
    vim.cmd "Neorg workspace notes"
  end, { nargs = 0 }),
  vim.api.nvim_create_user_command("Journal", function()
    vim.cmd "Note"
    vim.cmd "Neorg journal today"
  end, { nargs = 0 }),
}
