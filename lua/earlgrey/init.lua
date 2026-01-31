local M = {}

-- Main loading function
function M.load()
	-- 1. Standard Neovim boilerplate to clear existing colors
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	-- 2. Inform Neovim of the theme name and ensure truecolor is on
	vim.g.colors_name = "earlgrey"
	vim.o.termguicolors = true

	-- 3. Import your modules
	--    (Note: we access .colors specifically because that's how we structured palette.lua)
	local colors = require("earlgrey.palette").colors
	local groups = require("earlgrey.theme").setup(colors)

	-- 4. Loop through the groups and apply them
	for group, settings in pairs(groups) do
		-- nvim_set_hl(namespace_id, highlight_group, highlight_definition)
		-- namespace_id 0 means the global namespace
		vim.api.nvim_set_hl(0, group, settings)
	end
end

-- Optional: Setup function for user configuration (future proofing)
-- e.g., require("earlgrey").setup({ transparent = true })
function M.setup(config)
	-- For now, we just default to loading.
	-- You can add logic here later to override palette colors based on config.
	M.load()
end

return M
