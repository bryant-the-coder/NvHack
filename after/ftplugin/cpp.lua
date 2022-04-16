local options = {
    tabstop = 2,
    shiftwidth = 2,
    expandtab = true,
    smarttab = true,
}

for k, v in pairs(options) do
    vim.o[k] = v
end

-- Vertical split terminal
vim.keymap.set("n", "<leader>vs", "<cmd>90 vsp | :term<CR>")
