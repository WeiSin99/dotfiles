return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require('tokyonight').setup({
      style = "night",        -- or "day" for lighter variant
      transparent = true,     -- Enable transparency if you want
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
