local options = {
  updatetime = 300,
  termguicolors = true, -- true color support
  guicursor = '', -- only use block cursor
  number = true, -- show line number
  relativenumber = true, -- show line number relative the the line your cursor at
  scrolloff = 8, -- minimum number of lines above and below cursor when scrolling
  incsearch = true, -- highlight matching text while you search
  tabstop = 2, -- Number of spaces tabs count for
  shiftwidth = 2, -- Number of spaces used for auto indentation
  expandtab = true, -- replace tab with spaces
  wrap = false, -- disable line wrap
  smartindent = true, -- auto indent when starting a new line
  ignorecase = true, -- need to turn this on to enable smartcase
  smartcase = true, -- search using smartcase
  signcolumn = 'yes', -- always show signcolumn, otherwise text would shift
  splitright = true, -- put new windows to the right of the current
  showmode = false, -- do not show the mode
  cursorline = true, -- enable highlighting of the current line
  list = true, -- enable list to show trailing spaces, tab etc
  listchars = {
    tab = '» ',
    trail = '·',
    nbsp = '␣',
  },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
