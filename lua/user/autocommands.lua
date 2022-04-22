vim.cmd [[
  fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endfun

  augroup MY_GROUP
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    autocmd BufWritePre * :call TrimWhitespace()
  augroup END
]]
