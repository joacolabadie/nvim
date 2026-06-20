return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			css = { "prettierd" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			lua = { "stylua" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			xml = { "xmllint" },
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 1000,
		},
	},
}
