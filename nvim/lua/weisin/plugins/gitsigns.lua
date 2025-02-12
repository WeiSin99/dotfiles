return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  opts = {
    current_line_blame = true,
    signs = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '▎' },
      untracked = { text = '▎' },
    },
    signs_staged = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '▎' },
    },
    on_attach = function(buffer)
      vim.keymap.set('n', '[h', '<cmd>Gitsigns prev_hunk<cr>', { buffer = buffer, desc = 'Previous hunk' })
      vim.keymap.set('n', ']h', '<cmd>Gitsigns next_hunk<cr>', { buffer = buffer, desc = 'Next hunk' })
      vim.keymap.set(
        { 'n', 'v' },
        '<leader>ghs',
        '<cmd>Gitsigns stage_hunk<cr>',
        { buffer = buffer, desc = 'Stage hunk' }
      )
      vim.keymap.set(
        'n',
        '<leader>ghu',
        '<cmd>Gitsigns undo_stage_hunk<cr>',
        { buffer = buffer, desc = 'Undo stage hunk' }
      )
      vim.keymap.set(
        { 'n', 'v' },
        '<leader>ghr',
        '<cmd>Gitsigns reset_hunk<cr>',
        { buffer = buffer, desc = 'Reset hunk' }
      )
      vim.keymap.set('n', '<leader>ghp', '<cmd>Gitsigns preview_hunk<cr>', { buffer = buffer, desc = 'Preview hunk' })
      vim.keymap.set('n', '<leader>ghb', '<cmd>Gitsigns blame_line<cr>', { buffer = buffer, desc = 'Blame line' })
      vim.keymap.set('n', '<leader>ghB', '<cmd>Gitsigns blame<cr>', { buffer = buffer, desc = 'Blame buffer' })
    end,
  },
}
