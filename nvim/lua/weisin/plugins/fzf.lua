return {
  "ibhagwan/fzf-lua",
  event = 'VimEnter',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    fzf_bin = 'fzf',
    winopts = {
      no_hints = true,
    },
    previewers = {
      bat = {
        config = {
          highlight = "--style=numbers,changes --color=always --ignore-case",
        },
      },
    },
    files = {
      header = false,
      cwd_prompt = false,
    },
    grep = {
      multiline = 1,
    },
    fzf_colors = true,
  },
  keys = {
     { "<leader>p", "<cmd>FzfLua files<cr>" },
     { "<leader>f", "<cmd>FzfLua live_grep<cr>" },
     { "<leader>b", "<cmd>FzfLua buffers<cr>" },
  }
}
