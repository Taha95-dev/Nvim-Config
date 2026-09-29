-- ~/.config/nvim/lua/core/highlights.lua

-- Neo-tree custom highlights
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#2a2a2a" })
vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { bg = "#2a2a2a", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#7aa2f7", bold = true })
vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#c0caf5" })
vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#9ece6a" })
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#e0af68" })
vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#f7768e" })
vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#3b4261" })
