return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- local colors = {
		-- 	blue = "#65D1FF",
		-- 	green = "#3EFFDC",
		-- 	violet = "#FF61EF",
		-- 	yellow = "#FFDA7B",
		-- 	red = "#FF4A4A",
		-- 	fg = "#c3ccdc",
		-- 	bg = "#112638",
		-- 	inactive_bg = "#2c3043",
		-- }

		-- local my_lualine_theme = {
		-- 	normal = {
		-- 		a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.bg, fg = colors.fg },
		-- 	},
		-- 	insert = {
		-- 		a = { bg = colors.green, fg = colors.bg, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.bg, fg = colors.fg },
		-- 	},
		-- 	visual = {
		-- 		a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.bg, fg = colors.fg },
		-- 	},
		-- 	command = {
		-- 		a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.bg, fg = colors.fg },
		-- 	},
		-- 	replace = {
		-- 		a = { bg = colors.red, fg = colors.bg, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.bg, fg = colors.fg },
		-- 	},
		-- 	inactive = {
		-- 		a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
		-- 		b = { bg = colors.inactive_bg, fg = colors.semilightgray },
		-- 		c = { bg = colors.inactive_bg, fg = colors.semilightgray },
		-- 	},
		-- }

		local function maximize_status()
			return vim.t.maximized and " " or ""
		end

		lualine.setup({
			options = {
				-- theme = my_lualine_theme,
				-- theme = "tokyonight",
				theme = "catppuccin",

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
