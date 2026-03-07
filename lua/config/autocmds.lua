local indent_group = vim.api.nvim_create_augroup("UserIndentSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = indent_group,
	pattern = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"css",
		"html",
	},
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})
