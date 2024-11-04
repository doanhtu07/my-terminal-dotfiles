return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		require("treesitter-context").setup({
			enable = true,
			separator = "-",
		})

		vim.keymap.set(
			{ "n", "v" },
			"<leader>tc",
			"<cmd>TSContextToggle<cr>",
			{ desc = "[nvim-treesitter-context] Toggle treesitter context plugin" }
		)
	end,
}
