# Welcome to NvHack or my config repo

## Installation

1. cd into the directory of your nvim folder
   > Or not create a folder called as nvim
2. Run `git clone https://github.com/bryant-the-coder/NvHack.git`
3. Run `git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"` for windows users
   > `git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim` for unix users
4. Now run `nvim` and `:e lua/plugins/plugins.lua`
5. Then type `:source %` and run `:PackerSync`
6. Run `:checkhealth`
7. TADA~ Your done and setup

```
nvim
├─ .git
├─ .gitattributes
├─ .github
├─ .gitignore
├─ init.lua
├─ lua
│  ├─ core
│  │  ├─ autocmd.lua
│  │  ├─ autocommand.lua
│  │  ├─ keymaps.lua
│  │  ├─ mappings.lua
│  │  ├─ settings.lua
│  │  ├─ theme.lua
│  │  └─ utils.lua
│  ├─ custom
│  │  ├─ highlights.lua
│  │  └─ statusline.lua
│  └─ plugins
│     ├─ config
│     │  ├─ alpha.lua
│     │  ├─ autopairs.lua
│     │  ├─ bufferline.lua
│     │  ├─ cmp.lua
│     │  ├─ comment.lua
│     │  ├─ dashboard.lua
│     │  ├─ gitsigns.lua
│     │  ├─ indent.lua
│     │  ├─ lsp
│     │  │  ├─ handlers.lua
│     │  │  ├─ init.lua
│     │  │  ├─ installer.lua
│     │  │  └─ settings
│     │  │     ├─ jsonls.lua
│     │  │     └─ sumneko_lua.lua
│     │  ├─ lualine.lua
│     │  ├─ neorg.lua
│     │  ├─ notify.lua
│     │  ├─ null-ls.lua
│     │  ├─ nvim-tree.lua
│     │  ├─ other.lua
│     │  ├─ snippets.lua
│     │  ├─ startup.lua
│     │  ├─ telescope.lua
│     │  ├─ toggleterm.lua
│     │  ├─ treesitter.lua
│     │  ├─ trouble.lua
│     │  ├─ twilight.lua
│     │  └─ zen-mode.lua
│     └─ plugins.lua
├─ README.md
├─ spell
├─ stylua.toml
├─ todos
│  ├─ inbox.norg
│  └─ index.norg
└─ utils

```

## CREDITS

Thanks to these wonderful people. Their config guided me into making my config.

- [max397574](https://github.com/max397574/NeovimConfig)
  > Complicated config but you will find it very useful.
- [abzcoding](https://github.com/abzcoding/lvim)
  > amazing config. recommend to check it out.
- [tamton-aquib](https://github.com/tamton-aquib/nvim)
  > Remember to check his plugin. [staline](https://github.com/tamton-aquib/staline.nvim)
- [vsedov](https://github.com/vsedov/nvim)
- [tjdevseries](https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim)
