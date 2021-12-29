local cmd = vim.cmd
local g = vim.g
local o = vim.o

-- Theme
o.termguicolors = true


-- Gruvbox
-- g.gruvbox_transparent_bg = true

-- Tokyonight
g.tokyonight_style = "night"
g.tokyonight_italic_comments = false
g.tokyonight_italic_keywords = false
-- g.tokyonight_transparent = true
-- g.tokyonight_colors = { bg = "#1c1b26", warning = "#d38b04", hint = "#0064fc", magenta = "#12b385"}


-- Rosepine
g.rose_pine_bold_vertical_split_line = true
g.rose_pine_disable_italics = true

local p = require('rose-pine.palette')
g.rose_pine_colors = {
  punctuation = p.subtle,
  comment = p.subtle,
  hint = p.iris,
  info = p.foam,
  warn = p.gold,
  error = p.love,

  headings = {
    h1 = p.iris,
    h2 = p.foam,
    h3 = p.rose,
    h4 = p.gold,
    h5 = p.pine,
    h6 = p.foam,
  },
}

cmd [[colorscheme tokyonight]]


--local time = os.date("*t")
--if time.hour <=7 then
--  vim.g.gruvbox_hls_cursor='red'
--  vim.g.gruvbox_number_column = 'bg0'
--  vim.g.gruvbox_sign_column = 'bg0'
--  vim.g.gruvbox_underline = false
--  vim.g.gruvbox_undercurl = false
--  vim.cmd[[colorscheme gruvbox]]
-- elseif time.hour <= 11 then
--end

--7
--8
--9
--10

--11
--12
--13
--14

--15
--16
--17
--18

--19
--20
--21
--22
