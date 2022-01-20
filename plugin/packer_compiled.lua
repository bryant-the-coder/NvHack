-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\User\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\User\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\User\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\User\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\User\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { 'require("plugins.comment")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["bufferline.nvim"] = {
    config = { 'require("plugins.bufferline")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-buffer\\after\\plugin\\cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-npm"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-npm",
    url = "https://github.com/David-Kunz/cmp-npm"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-path\\after\\plugin\\cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["dashboard-nvim"] = {
    config = { 'require("plugins.dashboard")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0&current_line_blame_formatter_opts\1\0\1\18relative_time\2\nsigns\17changedelete\1\0\4\ttext\b│\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\14topdelete\1\0\4\ttext\b│\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vdelete\1\0\4\ttext\b│\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vchange\1\0\4\ttext\b│\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\badd\1\0\0\1\0\4\ttext\b│\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\28current_line_blame_opts\1\0\2\15debug_mode\2\23current_line_blame\2\1\0\4\14virt_text\2\18virt_text_pos\16right_align\22ignore_whitespace\1\ndelay\3�\a\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    config = { 'require("plugins.indent")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lsp-colors.nvim"] = {
    config = { 'require("plugins.other")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  neorg = {
    config = { 'require("plugins.neorg")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["neorg-telescope"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neorg-telescope",
    url = "https://github.com/nvim-neorg/neorg-telescope"
  },
  ["null-ls.nvim"] = {
    config = { 'require("plugins.null-ls")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("plugins.autopairs")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "vim-vsnip", "cmp-npm", "cmp-path", "cmp-buffer" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    config = { 'require("plugins.other")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("plugins.lsp")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { 'require("plugins.nvim-tree")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require("plugins.treesitter")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["staline.nvim"] = {
    config = { 'require("plugins.staline")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\staline.nvim",
    url = "https://github.com/tamton-aquib/staline.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { 'require("plugins.telescope")' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { 'require("plugins.toggleterm")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\tokyodark.nvim",
    url = "https://github.com/tiagovla/tokyodark.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { 'require("plugins.trouble")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { 'require("plugins.twilight")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-vsnip"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["zen-mode.nvim"] = {
    config = { 'require("plugins.zen-mode")' },
    loaded = true,
    path = "C:\\Users\\User\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: neorg
time([[Config for neorg]], true)
require("plugins.neorg")
time([[Config for neorg]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
require("plugins.twilight")
time([[Config for twilight.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
require("plugins.null-ls")
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require("plugins.autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
require("plugins.zen-mode")
time([[Config for zen-mode.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0&current_line_blame_formatter_opts\1\0\1\18relative_time\2\nsigns\17changedelete\1\0\4\ttext\b│\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\14topdelete\1\0\4\ttext\b│\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vdelete\1\0\4\ttext\b│\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vchange\1\0\4\ttext\b│\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\badd\1\0\0\1\0\4\ttext\b│\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\28current_line_blame_opts\1\0\2\15debug_mode\2\23current_line_blame\2\1\0\4\14virt_text\2\18virt_text_pos\16right_align\22ignore_whitespace\1\ndelay\3�\a\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: staline.nvim
time([[Config for staline.nvim]], true)
require("plugins.staline")
time([[Config for staline.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("plugins.lsp")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("plugins.cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require("plugins.nvim-tree")
time([[Config for nvim-tree.lua]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require("plugins.toggleterm")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("plugins.treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require("plugins.indent")
time([[Config for indent-blankline.nvim]], false)
-- Config for: lsp-colors.nvim
time([[Config for lsp-colors.nvim]], true)
require("plugins.other")
time([[Config for lsp-colors.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require("plugins.comment")
time([[Config for Comment.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
require("plugins.dashboard")
time([[Config for dashboard-nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require("plugins.other")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
require("plugins.bufferline")
time([[Config for bufferline.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require("plugins.trouble")
time([[Config for trouble.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-npm ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd vim-vsnip ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
