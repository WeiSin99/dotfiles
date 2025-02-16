return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  -- load obsidian.nvim only for markdown files that is in the obsidian vault
  event = {
    'BufReadPre ' .. vim.fn.expand('~') .. '/Documents/ws-vault/*.md',
    'BufNewFile ' .. vim.fn.expand('~') .. '/Documents/ws-vault/*.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
  },
  opts = {
    ui = { enable = false },
    completion = {
      min_chars = 1,
    },
    notes_subdir = '02 - Fleeting Notes',
    new_notes_location = 'notes_subdir',
    workspaces = {
      {
        name = 'My vault',
        path = '~/Documents/ws-vault',
      },
    },
    picker = {
      name = 'telescope.nvim',
    },
    daily_notes = {
      folder = '01 - Daily Notes',
      date_format = '%Y-%m-%d',
      alias_format = nil,
      default_tags = {},
      template = 'daily-note.md',
    },
    templates = {
      folder = 'templates',
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['<leader>of'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = true, expr = true, buffer = true },
      },
    },
    note_id_func = function(title)
      local formatted_title = ''
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        formatted_title = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          formatted_title = formatted_title .. string.char(math.random(65, 90))
        end
      end
      return formatted_title
    end,
    note_frontmatter_func = function(note)
      local aliases = vim.tbl_filter(function(alias)
        return alias ~= note.id
      end, note.aliases)

      local today = os.date('%Y-%m-%d')

      local out = { id = note.id, aliases = aliases, tags = note.tags, related = {}, date_created = today }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      out.last_updated = today

      return out
    end,
  },
  keys = {
    -- find
    { '<leader>ol', '<cmd>ObsidianLinks<cr>', desc = 'Obsidian links' },
    { '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = 'Obsidian backlinks' },
    { '<leader>ot', '<cmd>ObsidianToday<cr>', desc = 'Obsidian Today' },
    { '<leader>on', '<cmd>ObsidianNew<cr>', desc = 'ObsidianNew' },
  },
}
