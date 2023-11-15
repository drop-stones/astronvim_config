local utils = require "astronvim.utils"
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "norg" })
      end
    end,
  },
  {
    "nvim-neorg/neorg",
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
