return {
	"Bekaboo/dropbar.nvim",
	config = function()
		require("dropbar").setup({})

		vim.keymap.set("n", "<leader>op", function()
			require("dropbar.api").pick()
		end, { desc = "[dropbar] Dropbar outline pick" })
	end,
}
