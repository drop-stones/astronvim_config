-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
local scan = require "plenary.scandir"
return {
  -- Set up custom filetypes
  -- vim.filetype.add {
  --   extension = {
  --     foo = "fooscript",
  --   },
  --   filename = {
  --     ["Foofile"] = "fooscript",
  --   },
  --   pattern = {
  --     ["~/%.config/foo/.*"] = "fooscript",
  --   },
  -- }

  -- load all files in polish/
  scan.scan_dir(vim.fn.stdpath "config" .. "/lua/user/polish", {
    on_insert = function(entry)
      -- Get filename without extension
      local filename = entry:match("[^/^\\.]*%.lua"):gsub("%.lua", "")
      require("user.polish." .. filename)
    end,
  }),
}
