local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  vim.notify("indent_blankline not found")
  return
end

indent_blankline.setup({
  show_current_context = true,
  use_treesitter = true,
  -- to get node type
  -- :lua print(require("nvim-treesitter.ts_utils").get_node_at_cursor():type())
  char = "▏",
  context_char = "▏",
  context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_fragment",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
  },
})
