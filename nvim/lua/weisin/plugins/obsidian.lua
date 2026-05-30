return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  lazy = true,
  -- load obsidian.nvim only for markdown files that is in the obsidian vault
  event = {
    'BufReadPre ' .. vim.fn.expand('~') .. '/Library/Mobile Documents/iCloud~md~obsidian/Documents/ws-vault/*.md',
    'BufNewFile ' .. vim.fn.expand('~') .. '/Library/Mobile Documents/iCloud~md~obsidian/Documents/ws-vault/*.md',
  },
  opts = {
    workspaces = {
      {
        name = 'My vault',
        path = '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/ws-vault',
      },
    },
    legacy_commands = false,
    ui = { enable = false },
    frontmatter = { enabled = false },
    notes_subdir = '00-Inbox',
    new_notes_location = 'notes_subdir',
    templates = {
      folder = '99-meta/templates',
    },
    daily_notes = {
      folder = '70-journal',
      date_format = '%Y-%m-%d',
      alias_format = nil,
      template = 'daily.md',
    },
    note_id_func = function(title)
      if title ~= nil then
        return title
      else
        return require('obsidian.builtin').zettel_id()
      end
    end,
  },
  keys = {
    { '<leader>ol', '<cmd>Obsidian links<cr>', desc = 'Obsidian links' },
    { '<leader>ob', '<cmd>Obsidian backlinks<cr>', desc = 'Obsidian backlinks' },
    { '<leader>ot', '<cmd>Obsidian today<cr>', desc = 'Obsidian today' },
    { '<leader>od', '<cmd>Obsidian dailies<cr>', desc = 'Obsidian dailies' },
    { '<leader>os', '<cmd>Obsidian search<cr>', desc = 'Obsidian search' },
    { '<leader>on', '<cmd>Obsidian new<cr>', desc = 'ObsidianNew' },
  },
}
