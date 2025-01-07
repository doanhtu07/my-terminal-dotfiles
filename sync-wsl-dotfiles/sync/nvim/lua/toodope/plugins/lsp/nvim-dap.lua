return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		vim.keymap.set("n", "<leader>db", function()
			dap.toggle_breakpoint()
		end, { desc = "[nvim-dap] Toggle debug breakpoint" })

		vim.keymap.set("n", "<leader>dr", function()
			dap.continue()
		end, { desc = "[nvim-dap] Start or continue the debugger" })
	end,
}
