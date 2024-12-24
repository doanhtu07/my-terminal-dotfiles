return {
	"ray-x/lsp_signature.nvim", -- For signature help during typing
	event = "VeryLazy",
	opts = {
		bind = true,
		handler_opts = {
			border = "rounded",
		},
	},
	config = function(_, opts)
		require("lsp_signature").setup(opts)
	end,
}
