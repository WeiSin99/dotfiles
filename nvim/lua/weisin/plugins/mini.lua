local yank_relative_path = function()
  local path = MiniFiles.get_fs_entry().path
  local relative_path = vim.fn.fnamemodify(path, ':.')
  vim.fn.setreg('+', relative_path)
  print('Copied: ' .. relative_path)
end

return {
  'echasnovski/mini.nvim',
  version = false,
  event = 'VeryLazy',
  keys = {
    {
      '<leader>ef',
      function()
        require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = 'Open mini.files (Directory of Current File)',
    },
    {
      '<leader>eF',
      function()
        require('mini.files').open(vim.uv.cwd(), true)
      end,
      desc = 'Open mini.files (cwd)',
    },
  },
  config = function()
    require('mini.files').setup({
      content = {
        filter = function(entry)
          return entry.name ~= '.DS_Store' and entry.name ~= '.git' and entry.name ~= '.obsidian'
        end,
        -- -- In which order to show file system entries
        -- sort = function(entries)
        --   -- technically can filter entries here too, and checking gitignore for _every entry individually_
        --   -- like I would have to in `content.filter` above is too slow. Here we can give it _all_ the entries
        --   -- at once, which is much more performant.
        --   local all_paths = table.concat(
        --     vim.tbl_map(function(entry)
        --       return entry.path
        --     end, entries),
        --     '\n'
        --   )
        --   local output_lines = {}
        --   local job_id = vim.fn.jobstart({ 'git', 'check-ignore', '--stdin' }, {
        --     stdout_buffered = true,
        --     on_stdout = function(_, data)
        --       output_lines = data
        --     end,
        --   })
        --   -- command failed to run
        --   if job_id < 1 then
        --     return entries
        --   end
        --   -- send paths via STDIN
        --   vim.fn.chansend(job_id, all_paths)
        --   vim.fn.chanclose(job_id, 'stdin')
        --   vim.fn.jobwait({ job_id })
        --   return require('mini.files').default_sort(vim.tbl_filter(function(entry)
        --     return not vim.tbl_contains(output_lines, entry.path)
        --   end, entries))
        -- end,
      },

      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
    })

    require('mini.icons').setup({})

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        vim.keymap.set('n', '<leader>py', yank_relative_path, { buffer = args.data.buf_id })
      end,
    })
  end,
}
