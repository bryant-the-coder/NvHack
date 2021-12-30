local time = os.date("*t")
if time.hour <= 7 then
  vim.g.gruvbox_hls_cursor='red'
  vim.g.gruvbox_number_column = 'bg0'
  vim.g.gruvbox_sign_column = 'bg0'
  vim.g.gruvbox_underline = false
  vim.g.gruvbox_undercurl = false
  vim.cmd[[colorscheme gruvbox]]
elseif time.hour <= 11 then
  vim.g.rose_pine_bold_vertical_split_line = true
  vim.g.rose_pine_disable_italics = true
  vim.cmd[[colorscheme rose-pine]]
elseif time.hour <= 15  then
  vim.g.tokyonight_style = "storm"
  vim.g.tokyonight_italic_comments = false
  vim.g.tokyonight_italic_keywords = false
  vim.cmd[[colorscheme tokyonight]]
else
  vim.g.tokyonight_style = "night"
  vim.g.tokyonight_italic_comments = false
  vim.g.tokyonight_italic_keywords = false
  vim.cmd[[colorscheme tokyonight]]
end
