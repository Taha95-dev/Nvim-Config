return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local charcoal_theme = {
      normal = {
        a = { fg = "#161616", bg = "#9AA0A6", bold = true },
        b = { fg = "#E6DDD5", bg = "#2D2E30" },
        c = { fg = "#9AA0A6", bg = "NONE" },
      },
      insert = {
        a = { fg = "#161616", bg = "#7A8C74", bold = true },
        b = { fg = "#E6DDD5", bg = "#2D2E30" },
        c = { fg = "#9AA0A6", bg = "NONE" },
      },
      visual = {
        a = { fg = "#161616", bg = "#A38D73", bold = true },
        b = { fg = "#E6DDD5", bg = "#2D2E30" },
        c = { fg = "#9AA0A6", bg = "NONE" },
      },
      replace = {
        a = { fg = "#161616", bg = "#8C7B89", bold = true },
        b = { fg = "#E6DDD5", bg = "#2D2E30" },
        c = { fg = "#9AA0A6", bg = "NONE" },
      },
      command = {
        a = { fg = "#161616", bg = "#A38D73", bold = true },
        b = { fg = "#E6DDD5", bg = "#2D2E30" },
        c = { fg = "#9AA0A6", bg = "NONE" },
      },
      inactive = {
        a = { fg = "#505257", bg = "#161616" },
        b = { fg = "#505257", bg = "#161616" },
        c = { fg = "#505257", bg = "NONE" },
      },
    }

    require("lualine").setup({
      options = {
        theme = charcoal_theme,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = { "neo-tree" } },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "diagnostics" },
        lualine_y = { "diff", "filetype" },
        lualine_z = { "progress", "location" },
      },
    })
  end,
}
