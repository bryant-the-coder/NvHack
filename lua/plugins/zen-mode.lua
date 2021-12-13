require("zen-mode").setup{
  window = {
      backdrop = 0.95,
      width = 150, -- width of the Zen window
      height = 1, -- height of the Zen window
      -- by default, no options are changed for the Zen window
      -- uncomment any of the options below, or add other vim.wo options you want to apply
      options = {
        signcolumn = "yes",
        number = true,
      relativenumber = true, -- disable relative numbers
        cursorline = false, -- disable cursorline
        cursorcolumn = false, -- disable cursor column
        foldcolumn = "0", -- disable fold column
        list = true, -- disable whitespace characters
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false, -- disables the ruler text in the cmd line area
        showcmd = false, -- disables the command in the last line of the screen
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
    },
    -- callback where you can add custom code when the Zen window opens
    on_open = function(win)
    end,
    -- callback where you can add custom code when the Zen window closes
    on_close = function()
    end,
}
