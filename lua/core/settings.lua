-- Aliases for Neovim
local g = vim.g
local o = vim.opt

o.conceallevel = 2
-- Non-blinking in normal & visual mode
-- Blink in insert mode
o.guicursor = "n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
o.cursorline = false -- Shows cursorline

-- Mappings
g.mapleader = "," -- Setting map leader
o.mouse = "a" -- Enabling mouse mode in all modes

-- Theme
o.termguicolors = true

-- Basics
o.number = true -- Shows numbers
o.relativenumber = true -- Shows relative numbers
o.signcolumn = "yes:2"
o.scrolloff = 200 -- Stop scrolling on the number set

-- Splits
o.splitright = true
o.splitbelow = true

-- Editor
o.wrap = false -- Don't wrap
o.clipboard = "unnamedplus" -- Use system clipboard
o.foldmethod = "marker"
o.completeopt = "menuone,noselect,menu"
o.lazyredraw = true -- Don't redraw screen while processing macros

-- Command line
o.shortmess:append("I") -- Less and shorter messages in command line
o.cmdheight = 1 -- CMD height
o.hidden = true
o.history = 300 -- Remember 300 lines of history
o.updatetime = 200
o.smd = false -- Don't show mode in cmdline

-- Statusline
o.laststatus = 3
o.fillchars = {
	eob = " ",
	vert = "║",
	horiz = "═",
	horizup = "╩",
	horizdown = "╦",
	vertleft = "╣",
	vertright = "╠",
	verthoriz = "╬",
}

-- Tabs / Indent
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.smartindent = true
o.smarttab = true

-- Backups / Undo
o.backup = false -- Don't backup files
o.writebackup = false -- Don't write backup
o.undofile = false -- Don't write undofile
o.swapfile = false -- Don't write swapfile

-- Search
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.showmatch = true -- Shows show match
o.smartcase = true -- Don't ignore when uppercase search

-- Python
g.python3_host_prog = "C:/Python310/python.exe"
o.shell = "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
-- Builtin plugins
g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_matchit = 1
g.loaded_man = 1
g.loaded_remote_plugins = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.loaded_matchparen = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
