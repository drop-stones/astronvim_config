-- nvim-dap configs
local dap = require "dap"
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension/adapter/codelldb",
    args = { "--port", "${port}" },
  },
}
dap.configurations.c = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    initCommands = function()
      local commands = {}
      local sources = { vim.env.HOME .. "/.lldbinit", vim.fn.getcwd() .. "/.lldbinit" }
      for idx, source in ipairs(sources) do
        local file = io.open(source, "r")
        if file then
          local command = "command source " .. source
          table.insert(commands, command)
          file:close()
        end
      end
      return commands
    end,
  },
}
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c

-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
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

  -- notify
  require("notify").setup {
    background_colour = "#000000",
  },

  -- nvim-dap-projects
  require("nvim-dap-projects").search_project_config(),

  -- norg
  vim.api.nvim_create_user_command("Note", function()
    vim.cmd "cd ~/notes"
    vim.cmd "Neorg workspace notes"
  end, { nargs = 0 }),
  vim.api.nvim_create_user_command("Journal", function()
    vim.cmd "Note"
    vim.cmd "Neorg journal today"
  end, { nargs = 0 }),
}
