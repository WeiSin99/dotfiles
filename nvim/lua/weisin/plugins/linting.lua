return {
  'mfussenegger/nvim-lint',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      javascript = { 'eslint' },
      typescript = { 'eslint' },
      javascriptreact = { 'eslint' },
      typescriptreact = { 'eslint' },
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
      group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
