vim.cmd [[
  fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endfun

  augroup AIG_FRONTEND
    autocmd!
    autocmd BufEnter /Users/weisin/Desktop/Alpha\ Investing\ Group/aig-frontend/*/*.js :set filetype=javascriptreact
  augroup END
]]

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "TermCursor" })
  end,
})
