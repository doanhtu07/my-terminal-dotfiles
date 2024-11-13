return {
	"hedyhli/outline.nvim",
	config = function()
		-- Example mapping to toggle outline
		vim.keymap.set("n", "<leader>ol", "<cmd>Outline<CR>", { desc = "[outline] Toggle Outline" })

		require("outline").setup({
			-- Your setup opts here (leave empty to use defaults)
		})
	end,
}
