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
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "mason-org/mason.nvim" },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = mason_lsp_servers,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			{ "mason-org/mason.nvim" },
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = mason_tools,
				run_on_start = true,
				auto_update = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("gopls", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = { Lua = { diagnostics = { globals = { "vim", "Snacks" } } } },
			})

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							client.request("workspace/executeCommand", {
								command = "_typescript.organizeImports",
								arguments = { vim.api.nvim_buf_get_name(bufnr) },
							}, nil, bufnr)
						end,
					})
				end,
			})

			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
			})

			vim.lsp.enable("gopls")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("tailwindcss")

			vim.keymap.set("n", "K", vim.lsp.buf.hover)
		end,
	},
}
