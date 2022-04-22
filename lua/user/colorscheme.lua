local colorscheme = "gruvbox-material"

vim.cmd[[
  let g:gruvbox_material_palette = 'original'
  let g:gruvbox_material_background = 'hard'
]]
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- for theme that doesn't support document highlighting
-- vim.cmd [[
  -- hi LspReferenceRead guibg=#36383F
  -- hi LspReferenceText guibg=#36383F
  -- hi LspReferenceWrite guibg=#36383F
-- ]]
