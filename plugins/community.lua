return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- GUI config
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { import = "astrocommunity.utility.transparent-nvim" },

  -- LSP config
  { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.lua" },
}
