-- Bootstrap Lazyvim: Install Lazyvim if not yet

-- https://practical.li/neovim/reference/neovim/standard-path/
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- .. is for concatenate strings

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- Add lazy path to run time path of Neovim
vim.opt.rtp:prepend(lazypath)

-- Tell lazy where our plugins are
require("lazy").setup({
	{ import = "toodope.plugins" }, -- init.lua
	{ import = "toodope.plugins.files-editing" },
	{ import = "toodope.plugins.files-navigation" },
	{ import = "toodope.plugins.formatting" },
	{ import = "toodope.plugins.fun" },
	{ import = "toodope.plugins.git" },
	{ import = "toodope.plugins.lsp" },
	{ import = "toodope.plugins.markdown" },
	{ import = "toodope.plugins.text-completion" },
	{ import = "toodope.plugins.ui" },
	{ import = "toodope.plugins.utils" },
	{ import = "toodope.plugins.windows" },
}, {
	-- for lazy to check if there are any plugins need to update and show us
	checker = {
		enabled = true,
		notify = false,
	},
})
