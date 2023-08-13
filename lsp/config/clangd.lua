-- clangd config
return {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  root_dir = require("lspconfig.util").root_pattern(".clangd", ".git", "compile_commands.json"),
}
