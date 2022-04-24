local ok, material = pcall(require, "material")
if not ok then
  vim.notify("colorscheme material not found!")
  return
end

local colorscheme = "material"

material.setup({
  contrast = {
    sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = false, -- Enable contrast for floating windows
    line_numbers = true, -- Enable contrast background for line numbers
    sign_column = false, -- Enable contrast background for the sign column
    cursor_line = false, -- Enable darker background for the cursor line
    non_current_windows = false, -- Enable darker background for non-current windows
    popup_menu = false, -- Enable lighter background for the popup menu
  },

  italics = {
    comments = false, -- Enable italic comments
    keywords = false, -- Enable italic keywords
    functions = false, -- Enable italic functions
    strings = false, -- Enable italic strings
    variables = false -- Enable italic variables
  },

  contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
    "terminal", -- Darker terminal background
    "packer", -- Darker packer background
    "qf" -- Darker qf list background
  },

  high_visibility = {
    lighter = true, -- Enable higher contrast text for lighter style
    darker = true -- Enable higher contrast text for darker style
  },

  disable = {
    borders = false, -- Disable borders between verticaly split windows
    background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
    term_colors = false, -- Prevent the theme from setting terminal colors
    eob_lines = false -- Hide the end-of-buffer lines
  },

  lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

  async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

  custom_highlights = {
    LspReferenceRead = { bg = "#3b4261" },
    LspReferenceText = { bg = "#3b4261" },
    LspReferenceWrite = { bg = "#3b4261" },
    Visual = { bg = "#292b36" },
    LineNr = { fg = "#5e6273", bg = "#090b10"  },
    -- Comment = { fg = "#383c4a" },
  } -- Overwrite highlights with your own
})

vim.g.material_style = "deep ocean"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- for theme that doesn't support document highlighting
-- vim.cmd [[
  -- hi LspReferenceRead guibg=#3b4261
  -- hi LspReferenceText guibg=#3b4261
  -- hi LspReferenceWrite guibg=#3b4261
-- ]]
