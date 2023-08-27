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
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.json" },
  -- { import = "astrocommunity.pack.toml" },

  -- Editing support
  { import = "astrocommunity.editing-support.neogen" },

  -- Git
  { import = "astrocommunity.git.neogit" },

  -- Motion
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },

  -- Code runner
  { import = "astrocommunity.code-runner.overseer-nvim" },

  -- Note taking
  { import = "astrocommunity.note-taking.neorg" },
  {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes",
              work = "~/notes/work",
              journal = "~/notes/journal",
              book = "~/notes/book",
            },
          },
        },
      },
    },
  },
}
