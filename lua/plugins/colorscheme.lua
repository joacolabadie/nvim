return {
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("zenbones")

			local cursorline_hl = vim.api.nvim_get_hl(0, { name = "CursorLine", link = false })
			local cursorline_bg = cursorline_hl.bg

			if cursorline_bg then
				vim.api.nvim_set_hl(0, "LineNr", { bg = cursorline_bg })
			end
		end,
	},
}
