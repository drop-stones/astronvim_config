-- set vim options here (vim.<first_key>.<second_key> = value)
-- return {
--   opt = {
--     -- set to true or false etc.
--     relativenumber = true, -- sets vim.opt.relativenumber
--     number = true, -- sets vim.opt.number
--     spell = false, -- sets vim.opt.spell
--     signcolumn = "auto", -- sets vim.opt.signcolumn to auto
--     wrap = false, -- sets vim.opt.wrap
--     cursorline = false, -- sets vim.opt.cursorline
--     shell = "zsh",
--     shellcmdflag = "-c",
--     shellquote = "",
--     shellxquote = "",
--   },
--   g = {
--     mapleader = " ", -- sets vim.g.mapleader
--     autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
--     cmp_enabled = true, -- enable completion at start
--     autopairs_enabled = true, -- enable autopairs at start
--     diagnostics_mode = 3, -- set the visibility of diagnostics in the ui (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
--     icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
--     ui_notifications_enabled = true, -- disable notifications when toggling UI elements
--     resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
--   },
-- }
-- If you need more control, you can use the function()...end notation
return function(local_vim)
  local_vim.opt.relativenumber = true
  local_vim.opt.number = true
  local_vim.opt.spell = false
  local_vim.opt.signcolumn = "auto"
  local_vim.opt.wrap = false
  local_vim.opt.cursorline = false

  if vim.fn.has "win32" then
    local_vim.opt.shell = vim.fn.executable "zsh" == 1 and "zsh" or "powershell"
    local_vim.opt.shellcmdflag = "-c"
    local_vim.opt.shellquote = ""
    local_vim.opt.shellxquote = ""
  end

  local_vim.g.mapleader = " "
  local_vim.g.autoformat_enabled = true
  local_vim.g.cmp_enabled = true
  local_vim.g.autopairs_enabled = true
  local_vim.g.diagnostics_mode = 3
  local_vim.g.icons_enabled = true
  local_vim.g.ui_notifications_enabled = true
  local_vim.g.resession_enabled = false

  return local_vim
end
