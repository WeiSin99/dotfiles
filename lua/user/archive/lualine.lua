local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("lualine not found")
  return
end

local mode = {
  "mode",
  --[[ fmt = function(str)
    return str
  end, ]]
}

-- cool function for progress
--[[ local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end ]]

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "material",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { "branch", "diagnostics", "diff" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
