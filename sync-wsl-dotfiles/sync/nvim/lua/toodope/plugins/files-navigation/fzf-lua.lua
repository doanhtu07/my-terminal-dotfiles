return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		local fzfLua = require("fzf-lua")
		local actions = require("fzf-lua.actions")

		-- https://www.reddit.com/r/neovim/comments/1aqyfru/how_do_i_format_the_results_in_fzflua/
		-- https://github.com/junegunn/fzf/issues/1534
		-- https://github.com/ibhagwan/fzf-lua/issues/881

		fzfLua.setup({
			defaults = {
				-- formatter = "path.filename_first",
			},
			winopts = {
				fullscreen = true,
				preview = {
					layout = "vertical",
				},
			},
			keymap = {
				fzf = {
					true, -- inherit from defaults
					["ctrl-o"] = "toggle-all",
				},
			},
			actions = {
				files = {
					true, -- inherit from defaults actions.files
					["ctrl-q"] = actions.file_sel_to_qf,
					["ctrl-l"] = actions.file_sel_to_ll,
				},
			},
			files = {
				fzf_opts = {
					["--keep-right"] = true,
				},
			},
			oldfiles = {
				fzf_opts = {
					["--keep-right"] = true,
				},
			},
			grep = {
				rg_glob = true, -- https://github.com/ibhagwan/fzf-lua/discussions/1501
			},
		})

		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>fb", function()
			fzfLua.buffers({
				cwd_only = true,
			})
		end, { desc = "[fzf-lua] Fuzzy find buffers" })

		keymap.set("n", "<leader>ff", function()
			fzfLua.files({
				resume = true,
			})
		end, { desc = "[fzf-lua] Fuzzy find files in cwd" })

		keymap.set("n", "<leader>fr", function()
			fzfLua.oldfiles({
				cwd_only = true,
			})
		end, { desc = "[fzf-lua] Fuzzy find recent files" })

		keymap.set("n", "<leader>fs", function()
			fzfLua.live_grep_resume()
		end, { desc = "[fzf-lua] Find string in cwd" })

		keymap.set("n", "<leader>fc", function()
			fzfLua.grep_cword()
		end, { desc = "[fzf-lua] Find string under cursor in cwd" })
	end,
}
