-- Aliases for Neovim
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local o = vim.opt

-- Guicursor
o.guicursor = 'n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'

-- Basic
g.mapleader = ','
o.mouse = 'a'
o.swapfile = false

-- Screen
o.number = true
o.relativenumber = true
o.showmatch = true
o.colorcolumn = '9999'
o.cursorline = false
o.scrolloff = 20
o.splitright = true
o.splitbelow = true
o.smartcase = true
o.wrap = false
o.clipboard = "unnamedplus"
o.cmdheight = 1
o.completeopt = "menuone,noselect,menu"
o.foldexpr = 'nvim_treesitter#foldexpr()'
g.autoread =true

-- Computer management
o.hidden = true
o.history = 300 -- remember 300 lines of history
o.lazyredraw = true
o.updatetime = 200

-- Tabs / Indent
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.smartindent = true

-- Backups / Undo
o.backup = false
o.writebackup = false
o.undofile = false
o.swapfile = false

-- Search
o.hlsearch = true
o.incsearch = true
o.ignorecase = true

-- Python
g.python3_host_prog = 'C:/Python310/python.exe'

