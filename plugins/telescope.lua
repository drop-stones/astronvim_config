local actions = require "telescope.actions"
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        n = {
          ["jk"] = actions.close,
          ["kj"] = actions.close,
        },
      },
    },
  },
}
