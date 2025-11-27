return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	version = "*",
	dependencies = {
		"folke/snacks.nvim",
	},
	config = function()
		require("bufferline").setup({
			options = {
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "left",
					},
				},
				right_mouse_command = function(n)
					Snacks.bufdelete.delete(n)
				end,
				separator_style = "slant",
				show_buffer_icons = false,
				show_buffer_close_icons = false,
			},
		})

		vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>")
		vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>")

		vim.keymap.set("n", "<leader>bc", "<cmd>lua Snacks.bufdelete.delete()<CR>")
		vim.keymap.set("n", "<leader>bo", "<cmd>lua Snacks.bufdelete.other()<CR>")
	end,
}
