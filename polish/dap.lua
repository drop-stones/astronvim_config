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
