-- Mode changes
vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })

-- Moving selected lines
vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv", { silent = true })

-- Centered scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Centered search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete without yanking
vim.keymap.set("n", "x", '"_x')

-- Clear search highlight
vim.keymap.set("n", "<C-c>", "<cmd>noh<CR>", { silent = true })

-- Highlight on yank
local yank_group = vim.api.nvim_create_augroup("UserHighlightOnYank", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	callback = function()
		vim.highlight.on_yank()
	end,
})
