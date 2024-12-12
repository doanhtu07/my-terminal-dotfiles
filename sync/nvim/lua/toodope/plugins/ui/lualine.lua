return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local function maximize_status()
			return vim.t.maximized and " " or ""
		end

		lualine.setup({
			options = {
				section_separators = { left = "", right = "" },
				component_separators = { left = "-", right = "-" },
			},
			sections = {
				lualine_b = {
					{
						"branch",
					},
				},

				lualine_c = {
					{
						"diagnostics",
					},
					{
						-- https://github.com/nvim-lualine/lualine.nvim/discussions/658
						-- :h lualine-filename-component-options
						"filename",
						file_status = true,
						path = 4,
						symbols = {
							modified = "●",
							readonly = "",
							unnamed = "[Empty Buffer]",
							newfile = "[New Buffer]",
						},
					},

					-- https://github.com/stevearc/aerial.nvim?tab=readme-ov-file#lualine
					-- { "aerial" },
				},

				-- Add a component to the X section in lualine (which is on the right) to show lazy.nvim status
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
					{ maximize_status },
				},

				lualine_y = {
					"progress",
				},

				lualine_z = {
					"location",
				},
			},
		})

		vim.opt.laststatus = 3 -- global statusline
	end,
}
