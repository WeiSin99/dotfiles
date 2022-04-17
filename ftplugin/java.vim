setlocal tabstop=4 softtabstop=4
setlocal shiftwidth=4

vnoremap <leader>/ :s/^/\/\//<CR>:nohls<CR>
vnoremap <leader>// :s/^\/\//<CR>:nohls<CR>

inoremap @sout System.out.println()<left>
