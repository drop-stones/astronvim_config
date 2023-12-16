local utils = require "astronvim.utils"
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "c_sharp" })
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "netcoredbg") end,
  },

  -- omnisharp settings (replaced by roslyn.nvim in the future)
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "omnisharp") end,
  },
  -- ref. https://github.com/amaanq/nvim-config/blob/6b05d966b2ba496b9c313221c1a80a02da8ccbfe/lua/plugins/extras/lang/csharp.lua#L15
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        omnisharp = {},
      },
      -- configure omnishparp to fix the semantic tokens bug
      setup = {
        omnisharp = function(_, _)
          require("lazyvim.util").on_attach(function(client, _)
            if client.name == "omnisharp" then
              ---@type string[]
              local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
              for i, v in ipairs(tokenModifiers) do
                tokenModifiers[i] = v:gsub(" ", "_")
              end
              ---@type string[]
              local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
              for i, v in ipairs(tokenTypes) do
                tokenTypes[i] = v:gsub(" ", "_")
              end
            end
          end)
          return false
        end,
      },
    },
  },

  -- roslyn.nvim settings
  -- {
  --   "jmederosalvarado/roslyn.nvim",
  --   dotnet_cmd = "dotnet", -- this is the default
  --   roslyn_version = "4.8.0-3.23475.7", -- this is the default
  --   on_attach = on_attach, -- required
  --   capabilities = capabilities, -- required
  -- },
}
