local options = {

	encoding = "utf-8",
	fileencoding = "utf-8",
	
	title = false,
	backup = false,
	swapfile = false,

	clipboard = "unnamedplus",
	mouse = "a",

	number = true,

	-- search
	hlsearch = true,
	ignorecase = true,
	smartcase = true,
	wrapscan = true,
	incsearch = true,

	-- tab
	autoindent = true,
	smartindent = true,
	-- expandtab = true,
	shiftwidth = 4,
	tabstop = 4,

}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

