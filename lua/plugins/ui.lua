return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local function is_buffer()
				return not (vim.bo.filetype == "alpha" or vim.bo.filetype == "neo-tree")
			end

			require("lualine").setup({
				options = {
					section_separators = { left = "", right = "" },
					component_separators = "",
					globalstatus = true,
				},
				sections = {
					lualine_a = {
						{ "mode" },
					},
					lualine_b = {
						{ "diff", cond = is_buffer },
						{ "diagnostics", cond = is_buffer },
					},
					lualine_c = {
						{
							"filename",
							cond = is_buffer,
						},
					},
					lualine_x = {
						{ "filetype", cond = is_buffer },
					},
					lualine_y = {},
					lualine_z = {
						{ "location" },
					},
				},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"folke/snacks.nvim",
		},
		config = function()
			require("bufferline").setup({
				options = {
					always_show_bufferline = false,
					separator_style = "slant",
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							text_align = "left",
						},
					},
					close_command = function(n)
						Snacks.bufdelete.delete(n)
					end,
					right_mouse_command = function(n)
						Snacks.bufdelete.delete(n)
					end,
				},
			})

			vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>")
			vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>")

			vim.keymap.set("n", "<leader>bc", "<cmd>lua Snacks.bufdelete.delete()<CR>", { desc = "Close buffer" })
			vim.keymap.set("n", "<leader>bo", "<cmd>lua Snacks.bufdelete.other()<CR>", { desc = "Close other buffers" })
		end,
	},
	{
		"folke/snacks.nvim",
		config = function()
			require("snacks").setup({
				indent = { enabled = true },
			})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup({
				icons = {
					mappings = false,
				},
			})
		end,
	},
}
