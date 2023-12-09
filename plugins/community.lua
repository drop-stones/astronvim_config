return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- GUI config
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { import = "astrocommunity.color.transparent-nvim" },

  -- LSP config
  { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.toml" },

  -- Editing support
  { import = "astrocommunity.editing-support.todo-comments-nvim" },

  -- Indent
  { import = "astrocommunity.indent.indent-blankline-nvim" },

  -- Motion
  { import = "astrocommunity.motion.nvim-surround" },

  -- Fuzzy-finder
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },

  -- Code runner
  { import = "astrocommunity.code-runner.overseer-nvim" },

  -- Git
  { import = "astrocommunity.git.diffview-nvim" },

  -- Note taking
  { import = "astrocommunity.note-taking.neorg" },

  -- Workflow
  { import = "astrocommunity.workflow.hardtime-nvim" },
}
