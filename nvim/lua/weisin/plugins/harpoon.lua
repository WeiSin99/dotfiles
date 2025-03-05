return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require('harpoon')
    local harpoon_extensions = require('harpoon.extensions')

    harpoon:setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    })
    harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
  end,
  keys = function()
    local keys = {
      {
        '<leader>h',
        function()
          local harpoon = require('harpoon')
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon Quick Menu',
      },
      {
        '<leader>H',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'Harpoon Add File',
      },
    }

    for i = 1, 9 do
      table.insert(keys, {
        '<leader>' .. i,
        function()
          require('harpoon'):list():select(i)
        end,
        desc = 'Harpoon to File ' .. i,
      })
    end
    return keys
  end,
}
