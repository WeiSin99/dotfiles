return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = 'night', -- or "day" for lighter variant
        transparent = true, -- Enable transparency if you want
      })
      -- vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        transparent_background = true,
        integrations = {
          blink_cmp = true,
          fzf = true,
          mason = true,
          treesitter = true,
          mini = {
            enabled = true,
            indentscope_color = '', -- catppuccin color (eg. `lavender`) Default: text
          },
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { 'undercurl' },
              hints = { 'undercurl' },
              warnings = { 'undercurl' },
              information = { 'undercurl' },
            },
          },
        },
        highlight_overrides = {
          mocha = function()
            return {
              Whitespace = { fg = '#62647D' },
              LineNr = { fg = '#62647D' },
              LspReferenceRead = { bg = '#62647D' },
              LspReferenceText = { bg = '#62647D' },
              LspReferenceWrite = { bg = '#62647D' },
              MiniFilesCursorLine = { bg = '#62647D' },
            }
          end,
        },
      })

      vim.cmd.colorscheme('catppuccin')
    end,
  },
}
