return {
  'folke/trouble.nvim',
  opts = {
    follow = false,
    modes = {
      diagnostics = {
        win = {
          size = 0.15,
        },
      },
      symbols = {
        win = {
          size = 0.2,
        },
        filter = {
          -- remove Package since luals uses it for control flow structures
          ['not'] = { ft = 'lua', kind = 'Package' },
          any = {
            -- all symbol kinds for help / markdown files
            ft = { 'help', 'markdown' },
            kind = {
              'Class',
              'Constructor',
              'Enum',
              'Field',
              'Function',
              'Interface',
              'Method',
              'Module',
              'Namespace',
              'Package',
              'Property',
              'Struct',
              'Trait',
              'Variable',
            },
          },
        },
      },
    },
  },
  cmd = 'Trouble',
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle follow=false filter.severity=vim.diagnostic.severity.ERROR<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
  },
}
