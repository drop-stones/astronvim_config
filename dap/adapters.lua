return {
  codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- command = vim.fn.stdpath "data" .. "/mason/packages/codelldb/bin/codelldb.cmd",
      command = vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension/adapter/codelldb",
      args = { "--port", "${port}" },
    },
  },
}
