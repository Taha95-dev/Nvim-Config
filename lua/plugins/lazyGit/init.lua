-- lua/plugins/lazygit.lua
return {
  "kdheepak/lazygit.nvim",
  cmd = { "LazyGit", "LazyGitCurrentFile", "LazyGitFilter" },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
}
