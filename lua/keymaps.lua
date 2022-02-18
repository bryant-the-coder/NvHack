local function map(mode, lhs, rhs, opts)
	local default_options = { noremap = true, silent = true }
	if opts then
		default_options = vim.tbl_extend("force", default_options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, default_options)
end

-----------------------------------
--           BASIC               --
-----------------------------------
-- Quitting
map("n", "<C-q>", "<cmd>q<CR>")

-- Buffer
map("n", "<leader>dd", "<cmd>bdelete<CR>")

-- ESC key
map("i", "jk", "<Esc>")
map("i", "JK", "<Esc>")
map("v", "jk", "<Esc>")

-- ESC to clear all highlights
map("i", "<Esc>", "<cmd>noh<CR>")
map("v", "<Esc>", "<cmd>noh<CR>")
map("n", "<Esc>", "<cmd>noh<CR>")

-- Terminal ESC key
map("t", "<ESC>", [[<C-\><C-n>]])

-- Don't yank text upon delete (good mapping btw)
map("n", "d", '"_d')
map("v", "d", '"_d')

-- Don't yank text on cut
map("n", "x", '"_x')
map("n", "x", '"_x')

-- Saving the traditional way
map("n", "<C-s>", "<cmd>w<CR>")
map("i", "<C-s>", "<cmd>w<CR>")
map("n", "<leader>sf", "<cmd>source % <CR>")
map("n", "<leader>fs", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 100)<CR>")

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

-- Yanking mayb?
map("v", ">", ">gv")
map("v", "<", "<gv")

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
map("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>")

-- TSPlayground
map("n", "<leader>tp", "<cmd>TSPlaygroundToggle<CR>")
map("i", "<leader>tp", "<cmd>TSPlaygroundToggle<CR>")

-- Packer
map("n", "<leader>pi", "<cmd>PackerInstall<CR>")
map("n", "<leader>pu", "<cmd>PackerUpdate<CR>")
map("n", "<leader>pc", "<cmd>PackerClean<CR>")
map("n", "<leader>ps", "<cmd>PackerSync<CR>")

-- LSP
map("n", "<leader>lr", [[<cmd>lua vim.lsp.buf.rename()<CR>]])
map("n", "<leader>ld", [[<cmd>lua vim.lsp.buf.definition()<CR>]])
map("n", "<leader>lt", [[<cmd>lua vim.lsp.buf.type_definition()<CR>]])
map("n", "<leader>lh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
map("n", "<C-a>", [[<cmd>lua vim.lsp.buf.references()<CR>]])
map("n", "<C-k>", [[<cmd>lua vim.diagnostic.goto_prev({border = "rounded"})<CR>]])
map("n", "<C-j>", [[<cmd>lua vim.diagnostic.goto_next({border = "rounded"})<CR>]])
map("n", "<leader>ss", "[[<cmd>lua vim.lsp.buf.formatting_sync()<CR>]]")

-- Harpooon
map("n", "<leader>lp", [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]])
map("n", "<leader>lf", [[<cmd>lua require("harpoon.mark").add_file()<CR>]])
map("n", "<leader>l;", [[<cmd>lua require("harpoon.ui").nav_prev()<CR>]])
map("n", "<leader>ll", [[<cmd>lua require("harpoon.ui").nav_next()<CR>]])
map("n", "<A-1>", [[<cmd>lua require("harpoon.ui").nav_file(1)<CR>]])
map("n", "<A-2>", [[<cmd>lua require("harpoon.ui").nav_next(2)<CR>]])
map("n", "<A-3>", [[<cmd>lua require("harpoon.ui").nav_next(3)<CR>]])
map("n", "<A-4>", [[<cmd>lua require("harpoon.ui").nav_next(4)<CR>]])

-- Telescope
map("n", "<leader>ff", [[<cmd>lua require'plugins.telescope'.find_files()<CR>]])
map("n", "<leader>fb", [[<cmd>lua require'telescope.builtin'.buffers()<CR>]])
map("n", "<leader>fw", [[<cmd>lua require'telescope.builtin'.live_grep()<CR>]])
map("n", "<leader>fp", [[<cmd>lua require'telescope.builtin'.file_browser()<CR>]])
map("n", "<leader>fc", [[<cmd>lua require'telescope.builtin'.colorscheme()<CR>]])
map("n", "<leader>fo", [[<cmd>lua require'telescope.builtin'.oldfiles()<CR>]])
map("n", "<leader>fk", [[<cmd>lua require'telescope.builtin'.keymaps()<CR>]])
map("n", "<leader>fm", [[<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>]])
map("n", "<leader>ft", [[<cmd>lua require'telescope.builtin'.treesitter()<CR>]])
map("n", "<leader>fd", [[<cmd>lua require'telescope.builtin'.diagnostics()<CR>]])
map("n", "<leader>fds", [[<cmd>lua require'telescope.builtin'.lsp_document_symbols()<CR>]])
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-Q>", "<Plug>luasnip-prev-choice", {})
-- map("n", "<leader>ffp", "<cmd>lua require('telescope.builtin').find_files({cwd='E:/coding_journey/cyber.nvim/'})<cr>") -- opening telescope in projects dir
