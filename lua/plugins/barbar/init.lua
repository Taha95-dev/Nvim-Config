-- ~/.config/nvim/lua/plugins/barbar/init.lua

return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",     -- Displays Git statuses directly on file tabs
    "nvim-tree/nvim-web-devicons", -- Language icons matching file extensions
  },
  init = function() vim.g.barbar_auto_setup = false end,
  config = function()
    require("barbar").setup({
      animation = false, -- Turn off animations for snappy performance
      auto_hide = false, -- Keep the top bar visible even if only one file is open
      icons = { buffer_index = false, filetype = { enabled = true } },
    })

    -- Fast Tab Actions (No leader key required!)
    vim.keymap.set("n", "<Tab>", "<cmd>BufferNext<CR>", { silent = true, desc = "Next open file tab" })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", { silent = true, desc = "Previous open file tab" })
    vim.keymap.set("n", "<leader>x", "<cmd>BufferClose<CR>", { silent = true, desc = "Close active file tab" })
  end,
}
