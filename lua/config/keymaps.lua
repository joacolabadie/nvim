local map = vim.keymap.set

map("n", "<M-l>", "<Cmd>vertical resize -2<CR>", { desc = "Make window narrower" })
map("n", "<M-h>", "<Cmd>vertical resize +2<CR>", { desc = "Make window wider" })
