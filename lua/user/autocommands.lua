vim.cmd [[
  fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endfun

  augroup MY_GROUP
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "TermCursor" })
    autocmd BufWritePre * :call TrimWhitespace()
  augroup END

  augroup AIG_FRONTEND
    autocmd!
    autocmd BufEnter /Users/weisin/Desktop/Alpha\ Investing\ Group/aig-frontend/*/*.js :set filetype=javascriptreact
  augroup END
]]
