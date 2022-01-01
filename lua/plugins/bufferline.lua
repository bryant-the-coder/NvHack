local present, bufferline = pcall(require, "bufferline")
if not present then
   return
end

bufferline.setup {
  options = {
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "sbuffer %d",
    middle_mouse_command = "vertical sbuffer %d",
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    view = "multiwindow",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    offsets = {{filetype = "NvimTree", text = "File Explorer" , text_align = "center", highlight = "pmenu" }},
    separator_style = "thin",
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },
}
