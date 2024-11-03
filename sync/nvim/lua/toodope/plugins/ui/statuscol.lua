-- https://github.com/kevinhwang91/nvim-ufo/issues/117
return {
	"luukvbaal/statuscol.nvim", -- to customize the status line on the left and hide some weird numbers there
	event = { "BufEnter" },
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		local builtin = require("statuscol.builtin")

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = true,
		})

		require("statuscol").setup({
			-- foldfunc = "builtin",
			-- setopt = true,
			setopt = true,
			relculright = false, -- whether to right-align the relative line number
			segments = {
				-- https://github.com/luukvbaal/statuscol.nvim/blob/main/lua/statuscol.lua
				-- _G.ScFa = get_fold_action
				-- _G.ScSa = get_sign_action
				-- _G.ScLa = get_lnum_action
				{ text = { "%s" }, click = "v:lua.ScSa", auto = true },
				{
					sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
					click = "v:lua.ScSa",
				},
				{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
			},
		})
	end,
}
