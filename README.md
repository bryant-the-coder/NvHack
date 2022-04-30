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

## Showcase

Custom dashboard
![image](https://user-images.githubusercontent.com/92417638/164396371-e8859c10-7436-432a-b1e6-09c7fdbb5f5c.png)

Custom telescope
![image](https://user-images.githubusercontent.com/92417638/164399112-1cd32c02-3539-4ea8-a72f-175d28c1eb3a.png)

Base16 + Custom highlights for bufferline
![image](https://user-images.githubusercontent.com/92417638/164400472-4d0c3f22-6bc3-424a-a70c-c9dd23ffcd02.png)


## CREDITS

Thanks to these wonderful people. Their config guided me into making my config.

- [NvChad](https://github.com/NvChad/Nvchad)
- [max397574](https://github.com/max397574/NeovimConfig)
  > Complicated config but you will find it very useful.
- [abzcoding](https://github.com/abzcoding/lvim)
  > amazing config. recommend to check it out.
- [tamton-aquib](https://github.com/tamton-aquib/nvim)
  > Remember to check his plugin. [staline](https://github.com/tamton-aquib/staline.nvim)
- [vsedov](https://github.com/vsedov/nvim)
- [tjdevseries](https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim)
