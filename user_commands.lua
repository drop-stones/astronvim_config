-- norg
vim.api.nvim_create_user_command("Note", function()
  vim.cmd "cd ~/notes"
  vim.cmd "Neorg workspace notes"
end, { nargs = 0 })
vim.api.nvim_create_user_command("Journal", function()
  vim.cmd "Note"
  vim.cmd "Neorg journal today"
end, { nargs = 0 })
