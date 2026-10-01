-- ~/.config/nvim/lua/core/keymaps.lua

local map = vim.keymap.set

-- Better navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize with arrows
map("n", "<A-Up>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<A-Down>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<A-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<A-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Telescope keymaps
vim.keymap.set("n", "<leader><leader>", function()
  require("telescope.builtin").find_files({ hidden = true })
end, { desc = "Find files (including hidden)" })
map("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fr", "<cmd>Telescope resume<CR>", { desc = "Resume previous search" })

-- Better escape
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Save with Ctrl+s
map("n", "<C-s>", ":w<CR>", { desc = "Save file" })
map("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file" })

-- Quit with Ctrl+q
map("n", "<C-q>", ":qa<CR>", { desc = "Quit all" })

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Better indenting
map("v", "<", "<gv", { desc = "Unindent" })
map("v", ">", ">gv", { desc = "Indent" })

-- Clear highlights
map("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear highlights" })

-- Build and debug
map("n", "<leader>m", ":make<CR>", { desc = "Build" })
map("n", "<leader>M", ":!debug-build<CR>", { desc = "Build Debug" })
map("n", "<F5>", ":lua require('dap').continue()<CR>", { desc = "Debug" })

-- Quickfix
map("n", "<leader>cn", ":cnext<CR>", { desc = "Next quickfix" })
map("n", "<leader>cp", ":cprev<CR>", { desc = "Previous quickfix" })

-- Window management
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })
map("n", "<leader>sc", ":close<CR>", { desc = "Close window" })

-- Move Lines 
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

