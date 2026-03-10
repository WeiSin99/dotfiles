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
    legacy_commands = false,
    ui = { enable = false },
    workspaces = {
      {
        name = 'My vault',
        path = '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/ws-vault',
      },
    },
    notes_subdir = '00 - Inbox',
    new_notes_location = 'notes_subdir',
    daily_notes = {
      folder = '01 - Daily Notes',
      date_format = '%Y-%m-%d',
      alias_format = nil,
      default_tags = { 'daily-notes' },
      template = 'daily-note.md',
    },
    templates = {
      folder = 'templates',
    },
    frontmatter = {
      sort = { 'id', 'title', 'aliases', 'topics', 'related', 'tags', 'last_updated', 'created_at' },
      func = function(note)
        local now = os.date('%Y-%m-%d %H:%M:%S') --[[@as string]]

        local aliases = vim.tbl_filter(function(alias)
          return alias ~= note.id and alias ~= note.title and alias ~= note.path.stem
        end, note.aliases)
        table.insert(aliases, note.path.stem)

        local out = { aliases = aliases, topics = {}, related = {}, tags = note.tags, created_at = now }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        out.id = out.created_at:gsub('[^%w]', '')
        out.title = note.path.stem
        out.last_updated = now

        return out
      end,
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
