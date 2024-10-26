return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
	},
	config = function()
		local neogit = require("neogit")

		neogit.setup({
			disable_line_numbers = false,
		})

		vim.keymap.set("n", "<leader>ng", function()
			neogit.open()
		end, { desc = "[neogit] Open Neogit" })

		vim.keymap.set("n", "<leader>nd", function()
			require("diffview").open({})
		end, { desc = "[neogit] Diff view git" })
	end,
}
