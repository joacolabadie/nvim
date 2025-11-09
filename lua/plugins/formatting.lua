return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = {
				lsp_format = "fallback",
			},

			formatters_by_ft = {
				lua = { "stylua" },

				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },

				json = { "prettierd" },

				html = { "prettierd" },
				css = { "prettierd" },
			},
		})
	end,
}
