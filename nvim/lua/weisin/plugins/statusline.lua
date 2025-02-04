local function format_clients_name(clients)
  if #clients == 0 then
    return 'n/a'
  else
    return table.concat(clients, ', ')
  end
end

-- get active lsp, linters and formatters
local function get_attached_clients()
  local buf_ft = vim.bo.filetype

  local lsp_clients = vim.lsp.get_clients({ bufnr = 0 })
  local lsp_client_names = vim.tbl_map(function(client)
    return client.name
  end, lsp_clients)

  local linters_by_ft = require('lint').linters_by_ft
  local linter_names = linters_by_ft[buf_ft] or {}

  local formatters = require('conform').list_formatters_to_run(0)
  local formatter_names = vim.tbl_map(function(formatter)
    return formatter.name
  end, formatters)

  return (
    string.format(
      '󰃠 %s 󱉶 %s  %s',
      format_clients_name(lsp_client_names),
      format_clients_name(linter_names),
      format_clients_name(formatter_names)
    )
  )
end

local function get_project_name()
  local cwd = vim.uv.cwd()
  local project_name = vim.fs.basename(cwd)

  return ' ' .. project_name
end

return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = {
    options = {
      theme = 'auto',
      disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'ministarter', 'snacks_dashboard' } },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { { 'branch', color = { gui = '' } } },
      lualine_c = {
        { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
        { 'filename' },
        { 'diff' },
      },
      lualine_x = { 'diagnostics' },
      lualine_y = { get_attached_clients },
      lualine_z = {
        { get_project_name, color = { gui = '' } },
      },
    },
  },
}
