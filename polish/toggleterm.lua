function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<esc>]], opts)
  vim.keymap.set("t", "jk", [[<esc>]], opts)
  vim.keymap.set("t", "kj", [[<esc>]], opts)
end

-- Use <esc> directly in lazygit
vim.cmd "autocmd! TermOpen term://*lazygit* lua set_terminal_keymaps()"
