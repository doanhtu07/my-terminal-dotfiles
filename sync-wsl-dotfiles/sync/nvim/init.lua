-- avoid clashing altogether
if vim.g.vscode then
	return
else
	-- Run the init in core
	require("toodope.core")

	-- Run lazy file in toodope
	require("toodope.lazy")
end
