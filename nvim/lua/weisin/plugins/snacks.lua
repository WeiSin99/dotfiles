return {
  'folke/snacks.nvim',
  event = 'VimEnter',
  opts = {
    lazygit = {},
    picker = {
      matcher = {
        fuzzy = true, -- use fuzzy matching
        smartcase = true, -- use smartcase
        ignorecase = true, -- use ignorecase
        sort_empty = false, -- sort results when the search string is empty
        filename_bonus = true, -- give bonus for matching file names (last part of the path)
        file_pos = true, -- support patterns like `file:line:col` and `file:line`
        -- the bonusses below, possibly require string concatenation and path normalization,
        -- so this can have a performance impact for large lists and increase memory usage
        cwd_bonus = false, -- give bonus for matching files in the cwd
        frecency = true, -- frecency bonus
        history_bonus = false, -- give more weight to chronological order
      },
      formatters = {
        file = {
          filename_first = false, -- display filename before the file path
          truncate = 80, -- truncate the file path to (roughly) this length
          filename_only = false, -- only show the filename
          icon_width = 2, -- width of the icon (in characters)
        },
      },
      debug = {
        scores = true, -- show scores in the list
      },
      win = {
        input = {
          keys = {
            -- close the picker on ESC instead of going to normal mode,
            ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
          },
        },
      },
    },
  },
  keys = {
    -- lazygit
    { '<leader>gl', '<cmd>lua Snacks.lazygit.open()<cr>', desc = 'Lazygit' },

    -- find
    { '<leader>fb', '<cmd>lua Snacks.picker.buffers()<cr>', desc = '[F]ind [B]uffers' },
    { '<leader>fp', '<cmd>lua Snacks.picker.files({ hidden = true })<cr>', desc = '[F]ind [P]roject (cwd)' },

    -- search
    { '<leader>sb', '<cmd>lua Snacks.picker.lines()<cr>', desc = '[S]earch [B]uffer' },
    { '<leader>sp', '<cmd>lua Snacks.picker.grep()<cr>', desc = '[S]earch [P]roject (cwd)' },
    { '<leader>shl', '<cmd>lua Snacks.picker.highlights()<cr>', desc = 'Search Highlight Groups' },
  },
}
