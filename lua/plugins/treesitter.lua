return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			local parsers = {
				"c",
				"cpp",
				"css",
				"haskell",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"tsx",
				"typescript",
			}
			ts.install(parsers)

			local filetypes = {
				"c",
				"cpp",
				"css",
				"haskell",
				"html",
				"javascript",
				"javascriptreact",
				"json",
				"lua",
				"markdown",
				"typescript",
				"typescriptreact",
			}

			local treesitter_group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true })

			vim.api.nvim_create_autocmd("FileType", {
				group = treesitter_group,
				pattern = filetypes,
				callback = function()
					vim.treesitter.start()

					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo.foldmethod = "expr"

					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
}
