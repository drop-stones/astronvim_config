local actions = require "diffview.actions"
return {
  "sindrets/diffview.nvim",
  opts = {
    enhanced_diff_hl = true,
    view = {
      merge_tool = {
        layout = "diff4_mixed",
      },
    },
    keymaps = {
      view = {
        { "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel." } },
        { "n", "<leader>o", actions.focus_files, { desc = "Bring focus to the file panel" } },
      },
      file_panel = {
        { "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel." } },
        { "n", "<leader>o", actions.focus_files, { desc = "Bring focus to the file panel" } },
      },
    },
  },
}
