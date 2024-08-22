return {
	"nvim-tree/nvim-tree.lua",
	version = "v1.5.0",
	lazy = true,
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup {}
	end,
}
