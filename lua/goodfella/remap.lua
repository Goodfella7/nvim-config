vim.g.mapleader = " "

vim.keymap.set("n","<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>p", ":r! xclip -o -selection clipboard<CR>")

vim.keymap.set("n","<leader>>", ":vertical resize +5<CR>")
vim.keymap.set("n","<leader><", ":vertical resize -5<CR>")

-- fuzzy keymas
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
