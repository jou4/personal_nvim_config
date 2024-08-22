-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

require("basics")
require("autocmds")
require("options")
require("keymaps")
require("colorscheme")

--vim.api.nvim_create_autocmd("User", {
--	pattern = "LazyDone",
--	once = true,
--	callback = function()
--		require("nvim-tree.api").tree.open()
--	end
--})
--vim.api.nvim_create_autocmd("VimEnter", {
--	once = true,
--	callback = function()
--		require("nvim-tree.api").tree.open()
--	end
--})
