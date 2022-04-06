local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

-- See :h indent_blankline.txt
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile", "help" }
vim.g.indent_blankline_filetype_exclude = {
  "help",
  "dashboard",
  "packer",
  "NvimTree",
  "Trouble",
  "neo-tree",
}
vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
  "class",
  "return",
  "function",
  "method",
  "^if",
  "^while",
  "jsx_element",
  "^for",
  "^object",
  "^table",
  "block",
  "arguments",
  "if_statement",
  "else_clause",
  "jsx_element",
  "jsx_self_closing_element",
  "try_statement",
  "catch_clause",
  "import_statement",
  "operation_type",
}

indent_blankline.setup {
  show_current_context = true,
  show_current_context_start = false,
}
