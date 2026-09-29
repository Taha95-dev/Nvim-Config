-- ~/.config/nvim/lua/core/init.lua

-- Force set leaders with a guard
if not vim.g.mapleader then
  vim.g.mapleader = " "
end
if not vim.g.maplocalleader then
  vim.g.maplocalleader = ","
end

-- Define mapping anchors first
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- Enable system clipboard
vim.opt.clipboard = "unnamedplus"

-- UI Display Tweaks
opt.number = true          -- Show absolute line number at cursor position
opt.relativenumber = true  -- Relative vertical leap tracking numbers
opt.cursorline = true      -- Subtle highlight across active code row
opt.termguicolors = true   -- Enable true color output
opt.signcolumn = "yes"     -- Keep layout margin static for git/error markers

-- Tab & Indentation Rules for Clean C/C++ Style Guidelines
opt.tabstop = 4            
opt.shiftwidth = 4         
opt.expandtab = true       -- Smart white-space conversion
opt.smartindent = true     -- Insert indents automatically according to syntax

-- Persistent Memory Tracking Engines
opt.undofile = true        -- Keeps your undo history even after closing Neovim!
opt.backup = false
opt.writebackup = false
opt.swapfile = false       -- No annoying .swp files cluttering your layout

-- Real-Time Search Control
opt.ignorecase = true
opt.smartcase = true       -- Overrides ignorecase if you type upper-case text
opt.hlsearch = false       -- Clear highlighting once you finish your jump query

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25

vim.opt.makeprg = "gcc -g -O0 -Wall -Wextra -o %< %"
vim.opt.errorformat = "%f:%l:%c: %m"

-- Denpendencies
require("core.keymaps")
require("core.highlights")
require("core.colorscheme")()
-- Load GDB keymaps
require("core.gdb")
