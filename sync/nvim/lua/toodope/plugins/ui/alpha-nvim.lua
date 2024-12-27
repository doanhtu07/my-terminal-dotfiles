local bannerArts = dofile(vim.fn.stdpath("config") .. "/scripts/arts.lua")

local function pickRandomElement(array)
	local randomIndex = math.random(#array) -- Generate a random index from 1 to the length of the array
	return array[randomIndex]
end

return {
	"goolord/alpha-nvim", -- This plugin is for greeter screen when we type "nvim" without going to any specific folder
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- 1. Set header

		-- https://emojicombos.com/anime-ascii-art
		-- Some art might be very 18+

		-- dashboard.section.header.val = pickRandomElement(bannerArts)

		-- 2. Set menu

		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),

			dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>FzfLua files<CR>"),
			dashboard.button("SPC fs", "  > Find Word", "<cmd>FzfLua live_grep<CR>"),

			dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionLoad<CR>"),
			dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- 3. Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
