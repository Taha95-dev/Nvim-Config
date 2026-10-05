-- lua/plugins/noice.lua
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",  -- optional, for nicer notifications
  },
  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true,
        view = "cmdline_popup",  -- floating window in the center
        format = {
          cmdline = { pattern = "^:", icon = "\u{f120} ", lang = "vim" },
        },
      },
      messages = {
        enabled = true,
        view = "notify",  -- or "mini" for bottom-right corner
      },
      popupmenu = {
        enabled = true,
        backend = "nui",
      },
      views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = {
              Normal = "NormalFloat",
              FloatBorder = "FloatBorder",
            },
          },
        },
        notify = {
          position = {
            row = "100%",
            col = "100%",
          },
        },
      },
    })

    -- Optional: map `<leader>sn` to dismiss notifications
    vim.keymap.set("n", "<leader>sn", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss notifications" })
  end,
}
