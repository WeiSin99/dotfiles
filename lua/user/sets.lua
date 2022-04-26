local options = {
  scrolloff = 8,
  guicursor = "",
  hlsearch = false,
  incsearch = true,
  number = true,
  relativenumber = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  wrap = false,
  smartindent = true,
  termguicolors = true,
  backspace = { "indent", "eol", "start" },
  updatetime = 300,
  signcolumn = "yes",
  splitright = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
