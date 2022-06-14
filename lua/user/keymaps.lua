local opts = { noremap = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

keymap("n", "<leader><CR>", ":lua require('user.utils').clearCachedPackage()<CR>:source init.lua<CR>", opts)

keymap("v", "<leader>p", '"_dP', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", 'gg"+yG', opts)

keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- nvim-tree
keymap("n", "<leader>b", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>p", "<cmd>lua require'telescope.builtin'.find_files({ hidden = true })<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)

-- Bufferline
keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", opts)
keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", opts)
keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", opts)
keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", opts)
keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", opts)
keymap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", opts)
keymap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", opts)
keymap("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", opts)
keymap("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", opts)
keymap("n", "<leader>l", "<cmd>BufferLineCycleNext<cr>", opts)
keymap("n", "<leader>h", "<cmd>BufferLineCyclePrev<cr>", opts)
keymap("n", "<leader>mbl", "<cmd>BufferLineMoveNext<cr>", opts)
keymap("n", "<leader>mbh", "<cmd>BufferLineMovePrev<cr>", opts)
keymap("n", "<leader>w", "<cmd>Bdelete<cr>", opts)

-- Comment
vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_current_linewise)")
vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_blockwise_visual)")

-- Gitsigns
keymap("n", "<leader>gd", "<cmd>Gitsigns preview_hunk<cr>", opts)
keymap("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", opts)

keymap("i", "{<CR>", "{<CR>}<C-c>O", opts)
keymap("i", "(<CR>", "(<CR>)<C-c>O", opts)
keymap("i", "[<CR>", "[<CR>]<C-c>O", opts)
keymap("i", "{", "{}<C-c>i", opts)
keymap("i", "(", "()<C-c>i", opts)
keymap("i", "[", "[]<C-c>i", opts)
keymap("i", "{}", "{}", opts)
keymap("i", "()", "()", opts)
keymap("i", "[]", "[]", opts)
