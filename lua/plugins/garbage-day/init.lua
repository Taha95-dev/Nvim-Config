return {
  "zeioth/garbage-day.nvim",
  event = "VeryLazy",
  opts = {
    aggressive_mode = false,        -- Set true to stop LSPs when switching filetypes
    grace_period = 60 * 2,         -- Seconds to wait after losing focus (default 15 min)
    excluded_lsp_clients = {        -- Servers that should NEVER be stopped
      "clangd",                     -- Keep clangd alive if you're actively coding C++
    },
    notifications = false,          -- Set true to see when it triggers
  },
}
