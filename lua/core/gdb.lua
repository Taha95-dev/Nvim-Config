-- ~/.config/nvim/lua/core/gdb.lua

local map = vim.keymap.set

local function with_repl(fn)
  local dap = require("dap")
  local session = dap.session()
  if not session or not session.repl_channel then
    vim.notify("No active DAP session", vim.log.levels.WARN)
    return
  end
  fn(dap, session.repl_channel)
end

-- Open REPL with GDB quality-of-life settings
map("n", "<leader>G", function()
  with_repl(function(dap, channel)
    dap.repl.open()
    vim.fn.chansend(channel, {
      "set print pretty on\n",
      "set print elements 0\n",
      "set print array-indexes on\n",
      "set pagination off\n",
      "set confirm off\n",
    })
  end)
end, { desc = "Open GDB REPL" })

-- Watch variable under cursor
map("n", "<leader>gw", function()
  with_repl(function(dap, channel)
    local word = vim.fn.expand("<cword>")
    dap.repl.open()
    vim.fn.chansend(channel, { "print " .. word .. "\n" })
  end)
end, { desc = "Watch variable under cursor" })

-- Examine memory (hex)
map("n", "<leader>gm", function()
  with_repl(function(dap, channel)
    local word = vim.fn.expand("<cword>")
    dap.repl.open()
    vim.fn.chansend(channel, { "x/16x " .. word .. "\n" })
  end)
end, { desc = "Examine memory (16 bytes hex)" })

-- Print pointer as typed array
map("n", "<leader>gp", function()
  with_repl(function(dap, channel)
    local word = vim.fn.expand("<cword>")
    dap.repl.open()
    vim.fn.chansend(channel, { "print *" .. word .. "@10\n" })
  end)
end, { desc = "Print pointer array (10 elements)" })
