return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Bold CV header (long strings, no escaping needed)
    dashboard.section.header.val = {
      "",
      [[ _____   ______    ____      ____  ____      ______  _______   ]],
      [[|\    \ |\     \  |    |    |    ||    |    |      \/       \  ]],
      [[ \\    \| \     \ |    |    |    ||    |   /          /\     \ ]],
      [[  \|    \  \     ||    |    |    ||    |  /     /\   / /\     |]],
      [[   |     \  |    ||    |    |    ||    | /     /\ \_/ / /    /|]],
      [[   |      \ |    ||    |    |    ||    ||     |  \|_|/ /    / |]],
      [[   |    |\ \|    ||\    \  /    /||    ||     |       |    |  |]],
      [[   |____||\_____/|| \ ___\/___ / ||____||\____\       |____|  /]],
      [[   |    |/ \|   || \ |   ||   | / |    || |    |      |    | / ]],
      [[   |____|   |___|/  \|___||___|/  |____| \|____|      |____|/  ]],
      [[     \(       )/      \(    )/      \(      \(          )/     ]],
      [[      '       '        '    '        '       '          '      ]],
      "",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "󰊳  New file", ":enew<CR>"),
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "󰊄  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
      dashboard.button("q", "󰿅  Quit", ":qa<CR>"),
    }

    local opts = vim.deepcopy(dashboard.config)
    opts.keymap = {
      { mode = "n", lhs = "e", rhs = ":enew<CR>", opts = { silent = true } },
      { mode = "n", lhs = "f", rhs = ":Telescope find_files<CR>", opts = { silent = true } },
      { mode = "n", lhs = "r", rhs = ":Telescope oldfiles<CR>", opts = { silent = true } },
      { mode = "n", lhs = "l", rhs = ":Lazy<CR>", opts = { silent = true } },
      { mode = "n", lhs = "q", rhs = ":qa<CR>", opts = { silent = true } },
    }

    alpha.setup(opts)
  end,
}
