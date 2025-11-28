return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			lua = { "luacheck" },

			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
		}

		local luacheck = lint.linters.luacheck
		luacheck.args = vim.list_extend({
			"--globals",
			"vim",
			"Snacks",
		}, luacheck.args or {})

		local lint_autogroup = vim.api.nvim_create_augroup("nvim_lint_config", { clear = true })

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
			group = lint_autogroup,

			callback = function()
				local ft = vim.bo.filetype
				if lint.linters_by_ft[ft] ~= nil then
					lint.try_lint()
				end
			end,
		})
	end,
}
