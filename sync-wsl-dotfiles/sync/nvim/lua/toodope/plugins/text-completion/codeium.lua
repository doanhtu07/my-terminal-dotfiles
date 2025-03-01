return {
	"Exafunction/codeium.vim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "hrsh7th/nvim-cmp",
	},
	event = "BufEnter",
	enabled = true,
	config = function()
		vim.g.codeium_disable_bindings = 1
		vim.g.codeium_enabled = 1

		vim.keymap.set("i", "<M-Bslash>", function()
			return vim.fn["codeium#Complete"]()
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<C-S-h>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<M-a>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<M-]>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<M-[>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true })
	end,
}
