vim.bo.shiftwidth = 2
vim.o.conceallevel = 2
vim.bo.commentstring = "#%s"
vim.wo.spell = true
vim.bo.spelllang = "en"
vim.o.foldenable = false

vim.keymap.set({ "n", "i" }, "<A-q>", "<cmd>w<CR>")
vim.cmd([[hi link NeorgMarkupVerbatim Comment]])
