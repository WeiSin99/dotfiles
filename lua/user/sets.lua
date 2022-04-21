local options = {
    scrolloff = 8,
    guicursor = "",
    hlsearch = true,
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
}

for k, v in pairs(options) do
    vim.opt[k] = v
end