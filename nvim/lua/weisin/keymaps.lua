local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = ","

map("n", "<leader><CR>", ":lua require('user.utils').clearCachedPackage()<CR>:source init.lua<CR>")

map("v", "<leader>p", '"_dP')
map("v", "<leader>y", '"+y')
map("n", "<leader>y", '"+y')
map("n", "<leader>Y", 'gg"+yG')

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<leader><C-j>", "<C-w>J")
map("n", "<leader>rh", ":vertical resize -2<CR>")
map("n", "<leader>rl", ":vertical resize +2<CR>")
map("n", "<leader>rj", ":resize -2<CR>")
map("n", "<leader>rk", ":resize +2<CR>")

