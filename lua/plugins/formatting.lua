return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			css = { "prettierd" },
			haskell = { "fourmolu" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			json = { "prettierd" },
			lua = { "stylua" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 1000,
		},
	},
}
