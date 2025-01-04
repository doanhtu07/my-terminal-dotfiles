return {
	"FabijanZulj/blame.nvim",
	config = function()
		require("blame").setup()
		vim.keymap.set("n", "<leader>hb", "<cmd>BlameToggle<cr>", { desc = "[blame] Git blame" })
	end,
}
