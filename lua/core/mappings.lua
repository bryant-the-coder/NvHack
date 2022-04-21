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

local map = vim.keymap.set
vim.api.nvim_set_keymap(
    "v",
    "<Leader>re",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    { noremap = true, silent = true, expr = false }
)

map("n", "<leader>ta", [[<cmd>put! =repeat(nr2char(10), v:count1)<cr>'[]])

-----------------------------------
--           BASIC               --
-----------------------------------
-- Quitting
map("n", "<C-q>", "<cmd>q<CR>")

-- Buffer
map("n", "<leader>dd", "<cmd>bdelete<CR>")

-- Pasting stuff
map("v", "p", "p:let @+=@0<CR>")

-- Folding
map("n", "<space>", "za")

-- Don't yank text upon delete (good mapping btw)
map("v", "d", '"_d"')

-- Don't yank text on cut
map("n", "x", '"_x')

-- Swap booleans
map("n", "<leader>sb", function()
    require("core.utils").swap_boolean()
end)

-- ESC to clear all highlights
map({ "n", "i", "v" }, "<ESC>", "<cmd>noh<CR>")

-- Rename (easy way)
map("n", "<A-r>", function()
    require("core.utils").rename()
end)

-- Saving the traditional way
map({ "n", "i" }, "<C-s>", "<cmd>w<CR>")
-- nimap("<C-s>", "<cmd>w<CR>")
map("n", "<leader>sf", "<cmd>source % <CR>")

--  j = gj
-- k = gk
map({ "n", "v" }, "j", "gj")
map({ "n", "v" }, "k", "gk")

-- Indenting
map("v", ">", ">gv")
map("v", "<", "<gv")

-- ESC key
map({ "i", "v" }, "jk", "<Esc>")
map({ "i", "v" }, "JK", "<ESC>")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Go to url
-- Windows user
map("n", "<leader>tu", function()
    require("core.utils").url("start")
end)
-- Mac or linux user
--[[ map("n", "<leader>tu", function()
	require("core.utils").go_to_url()
end) ]]

-- Disable arrow keys
map({ "n", "v" }, "<Up>", "<nop>")
map({ "n", "v" }, "<Down>", "<nop>")
map({ "n", "v" }, "<Left>", "<nop>")
map({ "n", "v" }, "<Right>", "<nop>")

-- Terminal ESC key
-- map("n", "<leader>vs", "<cmd>90 vsp | :term<CR>")
map("n", "<leader>v", "<cmd>vsp | :term<CR>")
map("n", "<leader>h", "<cmd>17 sp | :term<CR>")
map("t", "jk", "<C-\\><C-n>")
map("t", "<Esc>", "<C-\\><C-n> <cmd>bd!<CR>")

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

-- Insert a new line
-- Code from max
map("n", "<A-CR>", "O<ESC>j", { desc = "Empty line above" })
map("n", "<CR>", "o<ESC>k", { desc = "Empty line below" })
map("n", "<leader>lb", "i<CR><ESC>", { desc = "Line break at cursor" })
map("n", "<leader>il", "i <ESC>l", { desc = "Space before" })
map("n", "<leader>ih", "a <ESC>h", { desc = "Space after" })

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
-- map("n", "<C-k>", vim.diagnostic.goto_prev)
-- map("n", "<C-j>", vim.diagnostic.goto_next)
map("n", "<C-k>", function()
    vim.diagnostic.goto_prev({ border = "rounded" })
end)
map("n", "<C-j>", function()
    vim.diagnostic.goto_next({ border = "rounded" })
end)

-- Harpooon
map("n", "<A-p>", function()
    require("harpoon.ui").toggle_quick_menu()
end)
map("n", "<A-=>", function()
    require("harpoon.mark").add_file()
end)
map("n", "<A-1>", function()
    require("harpoon.ui").nav_file(1)
end)
map("n", "<A-2>", function()
    require("harpoon.ui").nav_file(1)
end)
map("n", "<A-3>", function()
    require("harpoon.ui").nav_file(3)
end)
map("n", "<A-4>", function()
    require("harpoon.ui").nav_file(4)
end)

-- Telescope
map("n", "<leader>ff", function()
    require("plugins.config.telescope").find_files()
end)
map("n", "<leader>fw", function()
    require("plugins.config.telescope").live_grep()
end)
map("n", "<leader>fd", function()
    require("plugins.config.telescope").diag()
end)
map("n", "<leader>fb", function()
    require("telescope.builtin").buffers()
end)
map("n", "<leader>fp", function()
    require("telescope.builtin").file_browser()
end)
map("n", "<leader>fc", function()
    require("telescope.builtin").colorscheme()
end)
map("n", "<leader>fo", function()
    require("telescope.builtin").oldfiles()
end)
map("n", "<leader>fk", function()
    require("telescope.builtin").keymaps()
end)
map("n", "<leader>fm", function()
    require("telescope.builtin").current_buffer_fuzzy_find()
end)
map("n", "<leader>ft", function()
    require("telescope.builtin").treesitter()
end)
