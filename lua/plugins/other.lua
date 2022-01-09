-- Colorizer
require 'colorizer'.setup {
  'css';
  'scss';
  'javascript';
  'typescript';
  'html';
  'lua'
}

  DEFAULT_OPTIONS = {
	RGB      = true;
	RRGGBB   = true;
	names    = true;
	RRGGBBAA = true;
	rgb_fn   = true;
	hsl_fn   = true;
	css      = true;
    css_fn   = true;
	mode     = 'background';
  }

-- lsp-colors
require("lsp-colors").setup({
  Error = "#EE4B2B",
  Warning = "#d9ff00",
  Information = "#08f7ff",
  Hint = "#00ff00"
})

-- indent-blankline
require("indent_blankline").setup {
    buftype_exclude = {"terminal"},
    filetype_exclude = {"dashboard", "NvimTree", "packer", "help"},
    show_current_context = true,
    show_current_context_start = true,
    context_patterns = {
        "class", "return", "function", "method", "^if", "^while", "jsx_element", "^for", "^object", "^table", "block", "arguments", "if_statement",
        "else_clause", "jsx_element", "jsx_self_closing_element", "try_statement", "catch_clause", "import_statement", "operation_type"
    },
}
