-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer not found")
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim")
  use("tpope/vim-surround")
  use("moll/vim-bbye")
  use("rhysd/clever-f.vim")

  -- colorscheme
  use("marko-cerovac/material.nvim")

  -- autocompletion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-nvim-lsp")

  -- snippet
  use("L3MON4D3/LuaSnip")

  -- LSP
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")

  -- Problem in commit fb7a3e40d4bae484bd6616e5f842616a815c73e7, Call bufload() on new log buffer causing error to be shown on REPL
  use({
    "Olical/conjure",
    commit = "bef8004d17f00b997a87d9b02b62f52664b2f9b9",
  })

  -- Telescope
  use("nvim-telescope/telescope.nvim")

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    commit = "4cccb6f494eb255b32a290d37c35ca12584c74d0",
    run = ":TSUpdate",
  })

  -- Comment
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Git
  use("lewis6991/gitsigns.nvim")

  -- nvim-tree
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")

  -- bufferline
  use("akinsho/bufferline.nvim")

  -- null-ls
  use("jose-elias-alvarez/null-ls.nvim")

  -- lualine
  use("nvim-lualine/lualine.nvim")

  -- indent-line
  use("lukas-reineke/indent-blankline.nvim")
end)
