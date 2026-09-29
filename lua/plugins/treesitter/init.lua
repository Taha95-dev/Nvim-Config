return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",              -- add this
  build = ":TSUpdate",
  config = function()
    local ok, treesitter = pcall(require, "nvim-treesitter.configs")
    if not ok then
      vim.notify("Treesitter not available", vim.log.levels.WARN)
      return
    end
    treesitter.setup({
      ensure_installed = { "lua", "vim", "c", "cpp", "python", "bash" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
