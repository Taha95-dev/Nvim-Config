-- ~/.config/nvim/lua/plugins/init.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy with import style
require("lazy").setup({
  -- Dependencies required for UI things
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "MunifTanjim/nui.nvim" },
  {
  "echasnovski/mini.icons",
      version = false,
      config = function()
        require("mini.icons").setup()
      end,
    },

  -- Import all plugin modules from plugins/ directory
  { import = "plugins.telescope" },
  { import = "plugins.colorscheme" },
  { import = "plugins.lsp" },
  { import = "plugins.cmp" },
  { import = "plugins.lualine" },
  { import = "plugins.barbar" },
  { import = "plugins.autopairs" },
  { import = "plugins.alpha" },
  { import = "plugins.treesitter" },
  { import = "plugins.mason" },
  { import = "plugins.dap" },
  { import = "plugins.server" },
  { import = "plugins.garbage-day" },
  { import = "plugins.emmet" },
  { import = "plugins.neo-tree" },
  { import = "plugins.lazyGit" },
  { import = "plugins.noice" },
  { import = "plugins.toggleterm" },
})
