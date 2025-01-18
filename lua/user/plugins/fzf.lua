return {
  "junegunn/fzf.vim",
  dependencies = {
    "junegunn/fzf",
    dir = "/usr/local/opt/fzf"
  },
  init = function()
    vim.g.fzf_vim = {
      command_prefix = 'Fzf',
    }
  end,
  keys = {
    { "<leader>p", "<cmd>FzfFiles<cr>"},
    { "<leader>f", "<cmd>FzfRg<cr>"},
    { "<leader>b", "<cmd>FzfBuffers<cr>"},
  },
}
