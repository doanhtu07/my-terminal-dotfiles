return {
	"akinsho/git-conflict.nvim",
	config = function()
		require("git-conflict").setup({
			default_mappings = false,
		})

		vim.keymap.set("n", "<leader>co", "<cmd>GitConflictChooseOurs<cr>", { desc = "[git-conflict] Choose ours" })
		vim.keymap.set("n", "<leader>ct", "<cmd>GitConflictChooseTheirs<cr>", { desc = "[git-conflict] Choose theirs" })
		vim.keymap.set("n", "<leader>cb", "<cmd>GitConflictChooseBoth<cr>", { desc = "[git-conflict] Choose both" })
		vim.keymap.set("n", "<leader>c0", "<cmd>GitConflictChooseNone<cr>", { desc = "[git-conflict] Choose none" })
		vim.keymap.set("n", "[x", "<cmd>GitConflictPrevConflict<cr>", { desc = "[git-conflict] Previous conflict" })
		vim.keymap.set("n", "]x", "<cmd>GitConflictNextConflict<cr>", { desc = "[git-conflict] Next conflict" })
	end,
}
