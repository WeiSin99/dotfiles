return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  -- The next commit (c82bf96f) drops Neovim 0.11 support. Remove this pin after upgrading to 0.12.
  commit = '90cd6580e720caedacb91fdd587b747a6e77d61f',
  build = ':TSUpdate',
  lazy = false, -- the main branch does not support lazy-loading
  config = function()
    -- runs asynchronously, and skips parsers that are already installed
    require('nvim-treesitter').install({
      'lua',
      'javascript',
      'typescript',
      'tsx',
      'markdown',
      'markdown_inline',
      'graphql',
      'prisma',
    })

    -- Neovim provides treesitter highlighting, but each filetype has to start it.
    -- pcall skips buffers whose parser is not installed yet.
    vim.api.nvim_create_autocmd('FileType', {
      desc = 'Start treesitter highlighting',
      group = vim.api.nvim_create_augroup('treesitter-highlight', { clear = true }),
      pattern = {
        'lua',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'markdown',
        'graphql',
        'prisma',
      },
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    -- TODO: look for better folding method
    -- to use treesitter folding, add these to the FileType callback above:
    -- vim.wo[0][0].foldmethod = 'expr'
    -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- and set vim.o.foldlevelstart = 99 so files open unfolded
  end,
}
