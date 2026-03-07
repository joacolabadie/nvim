local mason_lsp_servers = {
	"gopls",
	"lua_ls",
	"tailwindcss",
	"ts_ls",
}

local mason_tools = {
	"eslint_d",
	"luacheck",
	"prettierd",
	"stylua",
}

return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = mason_lsp_servers,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = {
			ensure_installed = mason_tools,
			auto_update = true,
			run_on_start = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lsp_group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true })
			local ts_group = vim.api.nvim_create_augroup("TsLsOrganizeImports", { clear = true })

			vim.api.nvim_create_autocmd("LspAttach", {
				group = lsp_group,
				callback = function(ev)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "LSP Hover" })
					vim.keymap.set(
						"n",
						"gd",
						vim.lsp.buf.definition,
						{ buffer = ev.buf, desc = "LSP Go to definition" }
					)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "LSP Rename" })
				end,
			})

			vim.lsp.config("gopls", { capabilities = capabilities })

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.config("tailwindcss", { capabilities = capabilities })

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				settings = {
					typescript = {
						format = {
							tabSize = 2,
							indentSize = 2,
							convertTabsToSpaces = true,
						},
					},
					javascript = {
						format = {
							tabSize = 2,
							indentSize = 2,
							convertTabsToSpaces = true,
						},
					},
				},
				on_attach = function(client, bufnr)
					vim.api.nvim_clear_autocmds({
						group = ts_group,
						buffer = bufnr,
					})

					vim.api.nvim_create_autocmd("BufWritePre", {
						group = ts_group,
						buffer = bufnr,
						callback = function()
							client:exec_cmd({
								title = "Organize Imports",
								command = "_typescript.organizeImports",
								arguments = { vim.api.nvim_buf_get_name(bufnr) },
							}, { bufnr = bufnr })
						end,
					})
				end,
			})
		end,
	},
}
