return {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  dependencies = {
    'rafamadriz/friendly-snippets',
    { 'saghen/blink.compat', lazy = true, version = '*' },
  },
  version = '*',
  opts = {
    keymap = { preset = 'default' },
    appearance = {
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
    },
    sources = {
      default = { 'lazydev', 'obsidian', 'obsidian_new', 'obsidian_tags', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
        obsidian = { name = 'obsidian', module = 'blink.compat.source' },
        obsidian_new = { name = 'obsidian_new', module = 'blink.compat.source' },
        obsidian_tags = { name = 'obsidian_tags', module = 'blink.compat.source' },
      },
    },
  },
  opts_extend = { 'sources.default' },
}
