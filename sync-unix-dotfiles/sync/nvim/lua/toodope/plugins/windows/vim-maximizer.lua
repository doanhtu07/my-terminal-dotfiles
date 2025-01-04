return {
	"declancm/maximize.nvim", -- This plugin is for maximize pane split
	keys = {
		{
			"<leader>sm",
			function()
				require("maximize").toggle()
			end,
			desc = "[maximize] Maximize/minimize a split",
		},
	},
}
