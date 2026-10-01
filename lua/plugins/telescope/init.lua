return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = "➜ ",
        path_display = { "smart" },
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.5,
          },
        },
        sorting_strategy = "ascending",

        -- Force ripgrep to search hidden files
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--no-ignore-vcs",
        }, 

        file_ignore_patterns = {
          "node_modules",
          "%.git/",
          "%.lock",
          "__pycache__",
          "%.pyc",
          "%.pyo",
          "%.swp",
          "%.swo",
          "build/"
        },
        -- Make Telescope transparent
        winblend = 0,
        -- Add these to make it transparent
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        border = true,
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.smart_send_to_qflist,
            ["<C-c>"] = actions.close,
          },
          n = {
            ["q"] = actions.close,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    -- Make Telescope highlights transparent
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopeMatching", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "NONE" })

    -- Load extensions
    pcall(telescope.load_extension, "fzf")
  end,
}
