-- ~/.config/nvim/lua/plugins/autopairs/init.lua
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function() require("nvim-autopairs").setup({}) end
}
