return {
	{
		"https://codeberg.org/andyg/leap.nvim",
		config = function()
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
			vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		keys = {
			{
				"<leader>a",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Harpoon add file",
			},

			-- Use Telescope picker for the menu (replaces harpoon.ui quick menu)
			{
				"<C-e>",
				function()
					require("harpoon_telescope").toggle()
				end,
				desc = "Harpoon (Telescope)",
			},

			{
				"<C-h>",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Harpoon 1",
			},
			{
				"<C-t>",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Harpoon 2",
			},
			{
				"<C-n>",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Harpoon 3",
			},
			{
				"<C-s>",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Harpoon 4",
			},
		},
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			-- Create a tiny module-like table so <C-e> can call it from keys
			-- (keeps telescope code in one place)
			local M = {}

			function M.toggle()
				local conf = require("telescope.config").values
				local list = harpoon:list()

				local file_paths = {}
				for _, item in ipairs(list.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({ results = file_paths }),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end

			-- expose it globally as a simple table so the key callback can call it
			_G.harpoon_telescope = M
		end,
	},
}

-- return {
-- 	"ThePrimeagen/harpoon",
-- 	branch = "harpoon2",
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- 	config = function()
-- 		local harpoon = require("harpoon")
-- 		harpoon:setup({})
--
-- 		local conf = require("telescope.config").values
-- 		local function toggle_telescope(harpoon_files)
-- 			local file_paths = {}
-- 			for _, item in ipairs(harpoon_files.items) do
-- 				table.insert(file_paths, item.value)
-- 			end
--
-- 			require("telescope.pickers")
-- 				.new({}, {
-- 					prompt_title = "Harpoon",
-- 					finder = require("telescope.finders").new_table({
-- 						results = file_paths,
-- 					}),
-- 					previewer = conf.file_previewer({}),
-- 					sorter = conf.generic_sorter({}),
-- 				})
-- 				:find()
-- 		end
--
-- 		vim.keymap.set("n", "<C-e>", function()
-- 			toggle_telescope(harpoon:list())
-- 		end, { desc = "Open harpoon window" })
--
-- 		vim.keymap.set("n", "<leader>a", function()
-- 			harpoon:list():add()
-- 		end)
--
-- 		vim.keymap.set("n", "<leader>hc", function()
-- 			harpoon:list():clear()
-- 		end)
--
-- 		vim.keymap.set("n", "<C-h>", function()
-- 			harpoon:list():select(1)
-- 		end)
-- 		vim.keymap.set("n", "<C-t>", function()
-- 			harpoon:list():select(2)
-- 		end)
-- 		vim.keymap.set("n", "<C-n>", function()
-- 			harpoon:list():select(3)
-- 		end)
-- 		vim.keymap.set("n", "<C-s>", function()
-- 			harpoon:list():select(4)
-- 		end)
-- 	end,
-- }
