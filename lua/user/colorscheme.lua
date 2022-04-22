local colorscheme = "gruvbox"

vim.cmd "let g:gruvbox_contrast_dark = 'hard'"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.cmd [[
  hi LspReferenceRead guibg=#36383F
  hi LspReferenceText guibg=#36383F
  hi LspReferenceWrite guibg=#36383F
]]
