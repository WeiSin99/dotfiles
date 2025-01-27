return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      -- A list of parser names, or "all" (the listed parsers MUST always be installed)
      ensure_installed = { "lua", "javascript" },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,

      highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      }
    })

    -- use treesitter folding, this will fold all foldable area when file is open
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

    -- create an autocommand to unfold everything when file is open
    vim.api.nvim_create_autocmd({'BufReadPost', 'FileReadPost'}, {
      desc = 'Unfold all foldable acre when file is open',
      group = vim.api.nvim_create_augroup('treesitter-folding', { clear = true }),
      callback = function()
        vim.api.nvim_feedkeys("zR", "n", true)
      end,
    })
  end
}
