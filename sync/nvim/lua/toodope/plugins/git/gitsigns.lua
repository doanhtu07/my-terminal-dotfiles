return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gs = require("gitsigns")

		gs.setup({
			signs = {
				add = { text = "╏" },
				change = { text = "╏" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "╏" },
				change = { text = "╏" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},

			on_attach = function(bufnr)
				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				-- Navigation

				map("n", "]h", function()
					gs.nav_hunk("next")
				end, "[gitsigns] Next Hunk")

				map("n", "[h", function()
					gs.nav_hunk("prev")
				end, "[gitsigns] Prev Hunk")

				-- Hunk actions

				map("n", "<leader>hs", gs.stage_hunk, "[gitsigns] Stage hunk")

				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "[gitsigns] Stage hunk")

				map("n", "<leader>hr", gs.reset_hunk, "[gitsigns] Reset hunk")

				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "[gitsigns] Reset hunk")

				map("n", "<leader>hu", gs.undo_stage_hunk, "[gitsigns] Undo stage hunk")

				map("n", "<leader>hp", gs.preview_hunk, "[gitsigns] Preview hunk")

				-- Buffer actions
				map("n", "<leader>hS", gs.stage_buffer, "[gitsigns] Stage buffer")
				map("n", "<leader>hR", gs.reset_buffer, "[gitsigns] Reset buffer")

				-- Git blame
				-- map("n", "<leader>hb", function()
				-- 	gs.blame_line({ full = true })
				-- end, "Blame line")
				-- map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

				-- Hunk diff
				--
				map("n", "<leader>hd", gs.diffthis, "[gitsigns] Diff this")

				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, "[gitsigns] Diff this ~")

				-- Text object
				-- mode-x: activated in visual mode only
				-- mode-o: activated in operator-pending mode only
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "[gitsigns] Gitsigns select hunk")
			end,
		})
	end,
}
