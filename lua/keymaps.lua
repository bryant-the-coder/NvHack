local map = vim.api.nvim_set_keymap
local defaut_opts = { noremap = true, silent = true }

-- ESC key
map('i', 'jk', '<Esc>', defaut_opts)
map('i', 'kj', '<Esc>', defaut_opts)
map('v', 'jk', '<Esc>', defaut_opts)
map('v', 'kj', '<Esc>', defaut_opts)
map('i', '<Esc>', '<cmd>noh<CR>', defaut_opts)
map('v', '<Esc>', '<cmd>noh<CR>', defaut_opts)
map('n', '<Esc>', '<cmd>noh<CR>', defaut_opts)

-- Saving the traditional way
map('n', '<C-s>', '<cmd>w<CR>', defaut_opts)
map('i', '<C-s>', '<cmd>w<CR>', defaut_opts)
map('n', '<leader>sf', '<cmd>source % <CR>', defaut_opts)

-- Resizing windows
map('n', '<C-up>', '<C-w>+', defaut_opts)
map('n', '<C-down>', '<C-w>-', defaut_opts)
map('n', '<C-left>', '<C-w>>', defaut_opts)
map('n', '<C-right>', '<C-w><', defaut_opts)

-- Quitting
map('n', '<C-q>', '<cmd>q<CR>', defaut_opts)

-- Packer
map('n', '<leader>pi', '<cmd>PackerInstall<CR>', defaut_opts)
map('n', '<leader>pu', '<cmd>PackerUpdate<CR>', defaut_opts)
map('n', '<leader>pc', '<cmd>PackerClean<CR>', defaut_opts)
map('n', '<leader>ps', '<cmd>PackerSync<CR>', defaut_opts)

-- Window Navigation
map('n', '<A-j>', '<C-w><C-j>', defaut_opts)
map('n', '<A-k>', '<C-w><C-k>', defaut_opts)
map('n', '<A-l>', '<C-w><C-l>', defaut_opts)
map('n', '<A-h>', '<C-w><C-h>', defaut_opts)

-- Open config folder
map('n', '<leader>oc', '<cmd>e $HOME/AppData/Local/nvim<CR>', defaut_opts)

-- Nvim-tree
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', defaut_opts)

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', defaut_opts)
map('n', '<leader>fw', '<cmd>Telescope live_grep<CR>', defaut_opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', defaut_opts)
map('n', '<leader>fp', '<cmd>Telescope file_browser<CR>', defaut_opts)
map('n', '<leader>fc', '<cmd>Telescope colorscheme<CR>', defaut_opts)
map('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>', defaut_opts)
map('n', '<leader>fm', '<cmd>Telescope current_buffer_fuzzy_find<CR>', defaut_opts)
map('n', '<leader>ft', '<cmd>Telescope treesitter<CR>', defaut_opts)
map('n', '<leader>fd', '<cmd>Telescope lsp_workspace_diagnostics<CR>', defaut_opts)
map('n', '<leader>fds', '<cmd>Telescope lsp_document_symbols<CR>', defaut_opts)
map('n', '<leader>fk', '<cmd>Telescope keymaps<CR>', defaut_opts)

-- Bufferline
map('n', '<A-1>', '<cmd>BufferLineGoToBuffer 1<CR>', defaut_opts)
map('n', '<A-2>', '<cmd>BufferLineGoToBuffer 2<CR>', defaut_opts)
map('n', '<A-3>', '<cmd>BufferLineGoToBuffer 3<CR>', defaut_opts)
map('n', '<A-4>', '<cmd>BufferLineGoToBuffer 4<CR>', defaut_opts)
map('n', '<A-5>', '<cmd>BufferLineGoToBuffer 5<CR>', defaut_opts)
map('n', '<A-6>', '<cmd>BufferLineGoToBuffer 6<CR>', defaut_opts)
map('n', '<A-7>', '<cmd>BufferLineGoToBuffer 7<CR>', defaut_opts)
map('n', '<A-8>', '<cmd>BufferLineGoToBuffer 8<CR>', defaut_opts)
map('n', '<A-9>', '<cmd>BufferLineGoToBuffer 9<CR>', defaut_opts)
map('n', '<A-10>', '<cmd>BufferLineGoToBuffer 9<CR>', defaut_opts)
map('n', '<leader>be', '<cmd>BufferLineSortByTab<CR>', defaut_opts)
map('n', '<leader>bpc', '<cmd>BufferLinePickClose<CR>', defaut_opts)

-- TSPlayground
map('n', '<leader>tp', '<cmd>TSPlaygroundToggle<CR>', defaut_opts)
map('i', '<leader>tp', '<cmd>TSPlaygroundToggle<CR>', defaut_opts)

-- Dashboard
map('n', '<leader>nf', '<cmd>DashboardNewFile<CR>', defaut_opts)
