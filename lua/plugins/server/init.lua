return {
  {
    "selimacerbas/live-server.nvim",
    keys = {
      { "<leader>ls", "<cmd>LiveServerStart<cr>", desc = "Start Live Server" },
      { "<leader>lt", "<cmd>LiveServerToggle<cr>", desc = "Toggle Live Server" },
      { "<leader>lS", "<cmd>LiveServerStop<cr>", desc = "Stop Live Server" },
    },
    opts = {
      -- Optional: set default port (default is 8000)
      default_port = 8000,
      -- Optional: auto-start on HTML files
      -- auto_start = { filetypes = { "html" }, port = 8000 },
    },
  },
}
