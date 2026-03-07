return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			lua = { "luacheck" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
		}

		lint.linters.luacheck.args = vim.list_extend({
			"--globals",
			"vim",
		}, lint.linters.luacheck.args or {})

		local group = vim.api.nvim_create_augroup("UserNvimLint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
			group = group,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
