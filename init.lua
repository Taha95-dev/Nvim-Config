-- the core bootstrap file

-- Set leaders FIRST before anything else
vim.g.mapleader = " "     -- Set leader to space
vim.g.maplocalleader = " "  -- Set localleader to comma

require("plugins")
require("core")
