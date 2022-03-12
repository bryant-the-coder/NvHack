--- Defining normal & insert mode keymaps
---@param lhs string Keymaps
---@param rhs string Command
---@param opts string Options
-- local function nimap(lhs, rhs, opts)
-- 	local default_options = { noremap = true, silent = true }
-- 	if opts then
-- 		default_options = vim.tbl_extend("force", default_options, opts)
-- 	end
-- 	vim.keymap.set({ "n", "i" }, lhs, rhs, default_options)
-- end

-- local nimap = require("core.utils").normal_insert()

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-----------------------------------
--           BASIC               --
-----------------------------------
-- Quitting
map("n", "<C-q>", "<cmd>q<CR>")

-- Buffer
map("n", "<leader>dd", "<cmd>bdelete<CR>")

-- Pasting stuff
map("v", "p", "p:let @+=@0<CR>")

-- Terminal ESC key
map("t", "<ESC>", [[<C-\><C-n>]])

-- Folding
map("n", "<space>", "za")

-- Don't yank text upon delete (good mapping btw)
map("v", "d", '"_d"')

-- Don't yank text on cut
map("n", "x", '"_x')

-- Indenting
map("v", ">", ">gv")
map("v", "<", "<gv")

-- ESC key
map({ "i", "v" }, "jk", "<Esc>")
map({ "i", "v" }, "JK", "<ESC>")

-- ESC to clear all highlights
map({ "n", "i", "v" }, "<ESC>", "<cmd>noh<CR>")

-- Saving the traditional way
map({ "n", "i" }, "<C-s>", "<cmd>w<CR>")
-- nimap("<C-s>", "<cmd>w<CR>")
map("n", "<leader>sf", "<cmd>source % <CR>")

-- Resizing windows
map("n", "<A-up>", "<C-w>+")
map("n", "<A-down>", "<C-w>-")
map("n", "<A-left>", "<C-w>>")
map("n", "<A-right>", "<C-w><")

-- Window Navigation
map("n", "J", "<C-w><C-j>")
map("n", "K", "<C-w><C-k>")
map("n", "L", "<C-w><C-l>")
map("n", "H", "<C-w><C-h>")

-- Buffer navigation
map("n", "<Tab>", "<cmd>bnext<CR>")
map("n", "<S-Tab>", "<cmd>bprevious<CR>")
map("n", "<C-w>", "<cmd>bdelete<CR>")

-- Moving lines up & down (complicated)
map("n", "<C-down>", "<cmd>m .+1<CR>==")
map("n", "<C-up>", "<cmd>m .-2<CR>==")
map("v", "<C-down>", "<cmd>m '>+1<CR>gv=gv")
map("v", "<C-up>", "<cmd>m '<-2<CR>gv=gv")

-----------------------------------
--           Plugins             --
-----------------------------------
-- Nvim-tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")

-- Zen-mode
map("n", "<leader>zm", "<cmd>ZenMode<CR>")

-- Trouble
map("n", "<leader>tt", "<cmd>Trouble<CR>")

-- Neogen
map("n", "<leader>ng", "<cmd>Neogen<CR>")

-- ToggleTerm
map("n", "<ledaer>lg>", function()
	return _lazygit_toggle()
end)

-- TSPlayground
map("n", "<leader>tp", "<cmd>TSPlaygroundToggle<CR>")
map("i", "<leader>tp", "<cmd>TSPlaygroundToggle<CR>")

-- Packer
map("n", "<leader>pi", "<cmd>PackerInstall<CR>")
map("n", "<leader>pu", "<cmd>PackerUpdate<CR>")
map("n", "<leader>pc", "<cmd>PackerClean<CR>")
map("n", "<leader>ps", "<cmd>PackerSync<CR>")

-- LSP
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename variables" })
map("n", "<leader>ld", vim.lsp.buf.definition)
map("n", "<leader>lt", vim.lsp.buf.type_definition)
map("n", "<leader>lh", vim.lsp.buf.signature_help)
map("n", "<leader>ss", vim.lsp.buf.formatting_sync)
map("n", "<leader>qf", vim.diagnostic.setqflist)
map("n", "<C-a>", vim.lsp.buf.references)
-- map("n", "<C-k>", vim.diagnostic.goto_prev({ border = "rounded" }))
-- map("n", "<C-j>", vim.diagnostic.goto_next({ border = "rounded" }))
map("n", "<C-k>", vim.diagnostic.goto_prev)
map("n", "<C-j>", vim.diagnostic.goto_next)

-- Harpooon
map("n", "<A-p>", function()
	return require("harpoon.ui").toggle_quick_menu()
end)
map("n", "<leader>af", function()
	return require("harpoon.mark").add_file()
end)
map("n", "<A-1>", function()
	return require("harpoon.mark").nav_file(1)
end)
map("n", "<A-2>", function()
	return require("harpoon.mark").nav_file(2)
end)
map("n", "<A-3>", function()
	return require("harpoon.mark").nav_file(3)
end)
map("n", "<A-4>", function()
	return require("harpoon.mark").nav_file(4)
end)

-- Telescope
map("n", "<leader>ff", [[<cmd>lua require'plugins.config.telescope'.find_files()<CR>]])
map("n", "<leader>fb", [[<cmd>lua require'telescope.builtin'.buffers()<CR>]])
map("n", "<leader>fw", [[<cmd>lua require'plugins.config.telescope'.live_grep()<CR>]])
map("n", "<leader>fp", [[<cmd>lua require'telescope.builtin'.file_browser()<CR>]])
map("n", "<leader>fc", [[<cmd>lua require'telescope.builtin'.colorscheme()<CR>]])
map("n", "<leader>fo", [[<cmd>lua require'telescope.builtin'.oldfiles()<CR>]])
map("n", "<leader>fk", [[<cmd>lua require'telescope.builtin'.keymaps()<CR>]])
map("n", "<leader>fm", [[<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>]])
map("n", "<leader>ft", [[<cmd>lua require'telescope.builtin'.treesitter()<CR>]])
map("n", "<leader>fd", [[<cmd>lua require'plugins.config.telescope'.diag()<CR>]])
map("n", "<leader>fds", [[<cmd>lua require'telescope.builtin'.lsp_document_symbols()<CR>]])
-- map("n", "<leader>ffp", "<cmd>lua require('telescope.builtin').find_files({cwd='E:/coding_journey/cyber.nvim/'})<cr>") -- opening telescope in projects dir

map("n", "<leader>ff", function()
	return require("plugins.config.telescope").find_files()
end)
map("n", "<leader>fb", function()
	return require("plugins.config.telescope").live_grep()
end)
