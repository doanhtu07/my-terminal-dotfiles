vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- mode, new keymap, original action
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- <CR> = Enter to execute the command
-- https://stackoverflow.com/questions/22142755/what-is-the-meaning-of-a-cr-at-the-end-of-some-vim-mappings
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>=", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>s=", "<C-w>5+", { desc = "Increase window height" })
keymap.set("n", "<leader>s-", "<C-w>5-", { desc = "Decrease window height" })
keymap.set("n", "<leader>s>", "<C-w>10>", { desc = "Increase window width" })
keymap.set("n", "<leader>s<", "<C-w>10<", { desc = "Decrease window width" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tc", "<cmd>BufferLinePick<CR>", { desc = "Choose tab" }) --  choose tab

-- indent and re-select
keymap.set("x", "<", "<gv", { desc = "Indent left" })
keymap.set("x", ">", ">gv", { desc = "Indent right" })

-- print file path
keymap.set("n", "<leader>ps", function()
	print(vim.fn.expand("%:p"))
end, {
	desc = "Show file path",
})
-- copy file path
keymap.set("n", "<leader>pc", function()
	vim.cmd("let @+ = expand('%:p')")
	print("Copied file path to clipboard")
end, {
	desc = "Copy file path",
})
-- show file type
keymap.set("n", "<leader>ft", function()
	local filetype = vim.filetype.match({ buf = 0 })
	print("File type: " .. tostring(filetype))
end, {
	desc = "Show file type",
})

-- buffer
keymap.set("n", "<leader>br", "<cmd>e!<CR>", { desc = "Refresh buffer" })

-- text wrap
keymap.set("n", "<leader>tw", function()
	if vim.opt.wrap:get() == true then
		vim.opt.wrap = false
	else
		vim.opt.wrap = true
	end
end, { desc = "Toggle text wrap" })

vim.opt.conceallevel = 0
vim.keymap.set("n", "<leader>mt", function()
	vim.schedule(function()
		if vim.opt.conceallevel:get() == 3 then
			vim.opt.conceallevel = 0
		elseif vim.opt.conceallevel:get() == 0 then
			vim.opt.conceallevel = 3
		end
		require("render-markdown").toggle()
	end)
end, { desc = "Toggle concealer" })
