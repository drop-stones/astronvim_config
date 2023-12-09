-- Commands to be executed automatically
return {
  -- formatoptions (we need to create autocmd because fo is overwritten by ftplugin)
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "*",
    callback = function() vim.opt.formatoptions:remove { "r", "o" } end,
  }),

  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "c", "cpp", "rust" },
    callback = function()
      vim.opt_local.tabstop = 4
      vim.opt_local.softtabstop = 4
      vim.opt_local.shiftwidth = 4
    end,
  }),
}
