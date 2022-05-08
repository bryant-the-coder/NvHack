local g = vim.g
local o = vim.opt

--Cursor & cursorline
o.guicursor = "n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
o.cursorline = true
o.cursorlineopt = { "number" } -- Highlighting the number where the cursor is on

-- Mappings
g.mapleader = ","
o.mouse = "a"

-- Theme
o.termguicolors = true

-- Number
o.number = true
o.relativenumber = true
o.signcolumn = "yes:2"

-- Splits
o.splitright = true
o.splitbelow = true

-- Command line
o.shortmess:append("I")
o.cmdheight = 1
o.hidden = true
o.history = 300
o.updatetime = 200
o.smd = false -- Don't show mode in cmdline

-- Tabs & Indent
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.smartindent = true
o.autoindent = true
o.smarttab = true
o.linebreak = true
o.breakindent = true

-- Search
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.showmatch = true -- Shows show match
o.smartcase = true -- Don't ignore when uppercase search

-- Statusline
o.laststatus = 3

-- Conceal
o.conceallevel = 2

-- See :h fillchars
local function window_separator(separators)
    if separators then
        o.fillchars = {
            eob = " ",
            fold = " ",
            vert = "║",
            horiz = "═",
            horizup = "╩",
            horizdown = "╦",
            vertleft = "╣",
            vertright = "╠",
            verthoriz = "╬",
        }
    else
        o.fillchars = {
            eob = " ",
            fold = " ",
            horiz = " ",
            horizup = " ",
            horizdown = " ",
            vert = " ",
            vertleft = " ",
            vertright = " ",
            verthoriz = " ",
        }
    end
end

window_separator(true)

-- Backups / Undo
o.backup = false -- Don't backup files
o.writebackup = false -- Don't write backup
o.undofile = false -- Don't write undofile
o.swapfile = false -- Don't write swapfile

-- Terminal
if vim.fn.has("windows") == 1 then
    o.shell = "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
end

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
g.did_load_filetypes = 0
g.do_filetype_lua = 1
