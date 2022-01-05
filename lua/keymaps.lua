local function map(mode, lhs, rhs, opts)
  local default_options = {noremap = true, silent = true}
  if opts then default_options = vim.tbl_extend("force", default_options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, default_options)
end

-----------------------------------
--           BASIC               --
-----------------------------------
-- Quitting
map('n', '<C-q>', ':q<CR>')

-- Buffer
map('n', '<leader>dd', ':bdelete<CR>')

-- ESC key
map('i', 'jk', '<Esc>')
map('i', 'JK', '<Esc>')
map('v', 'jk', '<Esc>')

-- ESC to clear all highlights
map('i', '<Esc>', ':noh<CR>')
map('v', '<Esc>', ':noh<CR>')
map('n', '<Esc>', ':noh<CR>')

-- Terminal ESC key
map('t', '<ESC>', [[<C-\><C-n>]])

-- Don't yank text upon delete (good mapping btw)
map('n', 'd', '"_d')
map('v', 'd', '"_d')

-- Don't yank text on cut
map('n', 'x', '"_x')
map('n', 'x', '"_x')

-- Saving the traditional way
map('n', '<C-s>', ':w<CR>')
map('i', '<C-s>', ':w<CR>')
map('n', '<leader>sf', ':source % <CR>')
map("n", "<leader>fs", ":lua vim.lsp.buf.formatting_sync(nil, 100)<CR>")

-- Resizing windows
map('n', '<A-up>', '<C-w>+')
map('n', '<A-down>', '<C-w>-')
map('n', '<A-left>', '<C-w>>')
map('n', '<A-right>', '<C-w><')

-- Window Navigation
map('n', 'J', '<C-w><C-j>')
map('n', 'K', '<C-w><C-k>')
map('n', 'L', '<C-w><C-l>')
map('n', 'H', '<C-w><C-h>')

-- Yanking mayb?
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Buffer navigation
map('n', '<Tab>',   ':bnext<CR>')
map('n', '<S-Tab>', ':bprevious<CR>')
map('n', '<C-w>',   ':bdelete<CR>')

-- Moving lines up & down (complicated)
map('n', '<C-down>', ':m .+1<CR>==')
map('n', '<C-up>', ':m .-2<CR>==')
map('v', '<C-down>', ":m '>+1<CR>gv=gv")
map('v', '<C-up>', ":m '<-2<CR>gv=gv")

-----------------------------------
--           Plugins             --
-----------------------------------
-- Nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>')


-- Zen-mode
map('n', '<leader>zm', ':ZenMode<CR>')

-- TSPlayground
map('n', '<leader>tp', ':TSPlaygroundToggle<CR>')
map('i', '<leader>tp', ':TSPlaygroundToggle<CR>')

-- Packer
map('n', '<leader>pi', ':PackerInstall<CR>')
map('n', '<leader>pu', ':PackerUpdate<CR>')
map('n', '<leader>pc', ':PackerClean<CR>')
map('n', '<leader>ps', ':PackerSync<CR>')

-- LSP
map('n', '<leader>lr', [[:lua vim.lsp.buf.rename()<CR>]])
map('n', '<leader>ld', [[:lua vim.lsp.buf.definition()<CR>]])
map('n', '<leader>lt', [[:lua vim.lsp.buf.type_definition()<CR>]])
map('n', '<leader>lh', [[:lua vim.lsp.buf.signature_help()<CR>]])
map('n', '<C-a>', [[:lua vim.lsp.buf.references()<CR>]])
map('n', '<C-k>', [[:lua vim.diagnostic.goto_prev({border = "rounded"})<CR>]])
map('n', '<C-j>', [[:lua vim.diagnostic.goto_next({border = "rounded"})<CR>]])
map('n', '<leader>ss', '[[:lua vim.lsp.buf.formatting_sync()<CR>]]')

-- Harpooon
map('n', '<A-p>', [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]])
map('n', '<leader>lf', [[:lua require("harpoon.mark").add_file()<CR>]])
map('n', '<leader>l;', [[:lua require("harpoon.ui").nav_prev()<CR>]])
map('n', '<leader>ll', [[:lua require("harpoon.ui").nav_next()<CR>]])
map('n', '<A-1>', [[:lua require("harpoon.ui").nav_file(1)<CR>]])
map('n', '<A-2>', [[:lua require("harpoon.ui").nav_next(2)<CR>]])
map('n', '<A-3>', [[:lua require("harpoon.ui").nav_next(3)<CR>]])
map('n', '<A-4>', [[:lua require("harpoon.ui").nav_next(4)<CR>]])

-- Telescope
map("n", "<leader>ff", [[:lua require'telescope.builtin'.find_files()<CR>]])
map("n", "<leader>fb", [[:lua require'telescope.builtin'.buffers()<CR>]])
map("n", "<leader>fw", [[:lua require'telescope.builtin'.live_grep()<CR>]])
map("n", "<leader>fp", [[:lua require'telescope.builtin'.file_browser()<CR>]])
map("n", "<leader>fc", [[:lua require'telescope.builtin'.colorscheme()<CR>]])
map("n", "<leader>fo", [[:lua require'telescope.builtin'.oldfiles()<CR>]])
map("n", "<leader>fk", [[:lua require'telescope.builtin'.keymaps()<CR>]])
map("n", "<leader>fm", [[:lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>]])
map("n", "<leader>ft", [[:lua require'telescope.builtin'.treesitter()<CR>]])
map("n", "<leader>fd", [[:lua require'telescope.builtin'.diagnostics()<CR>]])
map("n", "<leader>fds", [[:lua require'telescope.builtin'.lsp_document_symbols()<CR>]])
