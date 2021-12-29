local present, toggleterm = pcall(require, "toggleterm")
if not present then
   return
end

toggleterm.setup {
  size = 20,
  open_mapping = [[<c-\>]],
  shade_filetypes = {},
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'single',
    height = 20,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  },
}
