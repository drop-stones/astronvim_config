local overseer = require "overseer"
return {
  -- Re-run the last task
  vim.api.nvim_create_user_command("OverseerRestartLast", function()
    local tasks = overseer.list_tasks { recent_first = true }
    if vim.tbl_isempty(tasks) then
      vim.notify("No tasks found", vim.log.levels.WARN)
    else
      overseer.run_action(tasks[1], "restart")
    end
  end, {}),

  -- Run shell scripts in the current working directory
  overseer.register_template {
    name = "Run Shell Script",
    generator = function(opts, cb)
      local files = require "overseer.files"
      local scripts = vim.tbl_filter(function(filename) return filename:match "%.sh$" end, files.list_files(opts.dir))
      local ret = {}
      for _, filename in ipairs(scripts) do
        table.insert(ret, {
          name = filename,
          params = {
            args = { optional = true, type = "list", delimiter = " " },
          },
          builder = function(params)
            return {
              cmd = { os.getenv "SHELL", files.join(opts.dir, filename) },
              args = params.args,
            }
          end,
        })
      end
      cb(ret)
    end,
  },

  -- Build c++
  overseer.register_template {
    name = "clang++ build",
    builder = function()
      -- Full path to current file (see :help expand())
      local file = vim.fn.expand "%:p"
      return {
        cmd = { "clang++" },
        args = { file },
        components = { { "on_output_quickfix", open = true }, "default" },
      }
    end,
    condition = {
      filetype = { "cpp" },
    },
  },

  -- Make similar to vim-dispatch
  vim.api.nvim_create_user_command("Make", function(params)
    -- Insert args at the '$*' in the makeprg
    local cmd, num_subs = vim.o.makeprg:gsub("%$%*", params.args)
    if num_subs == 0 then cmd = cmd .. " " .. params.args end
    local task = require("overseer").new_task {
      cmd = vim.fn.expandcmd(cmd),
      components = {
        { "on_output_quickfix", open = not params.bang, open_height = 8 },
        "default",
      },
    }
    task:start()
  end, {
    desc = "Run your makeprg as an Overseer task",
    nargs = "*",
    bang = true,
  }),

  -- Asynchronous :Grep command
  vim.api.nvim_create_user_command("Grep", function(params)
    -- Insert args at the '$*' in the grepprg
    local cmd, num_subs = vim.o.grepprg:gsub("%$%*", params.args)
    if num_subs == 0 then cmd = cmd .. " " .. params.args end
    local task = overseer.new_task {
      cmd = vim.fn.expandcmd(cmd),
      components = {
        {
          "on_output_quickfix",
          errorformat = vim.o.grepformat,
          open = not params.bang,
          open_height = 8,
          items_only = true,
        },
        -- We don't care to keep this around as long as most tasks
        { "on_complete_dispose", timeout = 30 },
        "default",
      },
    }
    task:start()
  end, { nargs = "*", bang = true, complete = "file" }),
}
