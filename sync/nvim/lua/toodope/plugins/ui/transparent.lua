return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup({})
		vim.keymap.set("n", "<leader>tt", "<cmd>TransparentToggle<CR>", { desc = "[transparent] Toggle transparent" })
	end,
}
