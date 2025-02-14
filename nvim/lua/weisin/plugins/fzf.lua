return {
  'ibhagwan/fzf-lua',
  event = 'VimEnter',
  enabled = false,
  opts = {
    fzf_bin = 'fzf',
    winopts = {
      no_hints = true,
    },
    previewers = {
      bat = {
        config = {
          highlight = '--style=numbers,changes --color=always --ignore-case',
        },
      },
    },
    files = {
      cwd_prompt = false,
      no_header = true,
      no_header_i = true,
    },
    grep = {
      multiline = 1,
      no_header = true,
      no_header_i = true,
    },
    fzf_colors = true,
  },
  keys = {
    -- find
    { '<leader>fb', '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>', desc = '[F]ind [B]uffers' },
    { '<leader>fp', '<cmd>FzfLua files<cr>', desc = '[F]ind [P]roject (cwd)' },
    { '<leader>fg', '<cmd>FzfLua git_files<cr>', desc = '[F]ind [G]it Files' },
    -- search
    { '<leader>sb', '<cmd>FzfLua grep_curbuf<cr>', desc = '[S]earch [B]uffer' },
    { '<leader>sp', '<cmd>FzfLua live_grep<cr>', desc = '[S]earch [P]roject (cwd)' },
    { '<leader>sH', '<cmd>FzfLua highlights<cr>', desc = 'Search Highlight Groups' },
    -- git
    { '<leader>gc', '<cmd>FzfLua git_commits<CR>', desc = 'Commits' },
    { '<leader>gs', '<cmd>FzfLua git_status<CR>', desc = 'Status' },
  },
}
