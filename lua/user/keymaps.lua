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

keymap("n", "<leader>pv", ":Vex<CR>", opts)

-- Telescope
keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files()<cr>", opts)
keymap("n", "<leader>pf", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)

-- Comment
vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_current_linewise)")
vim.keymap.set("v", "<leader>/", '<Plug>(comment_toggle_blockwise_visual)')
