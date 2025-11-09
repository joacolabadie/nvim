return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {}

		local win_h = vim.api.nvim_win_get_height(0)
		local header_h = #dashboard.section.header.val

		local diff = math.max(0, win_h - header_h)

		local top = math.floor(diff / 2)
		local bottom = diff - top

		dashboard.config.layout = {
			{ type = "padding", val = top },
			dashboard.section.header,
			{ type = "padding", val = bottom },
		}

		alpha.setup(dashboard.config)
	end,
}
