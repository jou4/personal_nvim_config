local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

----Remap space as leader key
--keymap("", "<Space>", "<Nop>", opts)
--vim.g.mapleader = " "
--vim.g.maplocalleader = " "

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- New tab
keymap("n", "te", ":tabedit", opts)
-- New tab
keymap("n", "gn", ":tabnew<Return>", opts)
-- move tab
keymap("n", "gh", "gT", opts)
keymap("n", "gl", "gt", opts)

-- Split window
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Do not yank with x
keymap("n", "x", '"_x', opts)

-- Delete a word backwards
keymap("n", "dw", 'vb"_d', opts)

-- Move both ends of the line
keymap("n", "<Space>h", "^", opts)
keymap("n", "<Space>l", "$", opts)

-- Input command with ;
keymap("n", ";", ":", opts)

-- Yank by the end of the line
keymap("n", "Y", "y$", opts)

-- Force stop by <Space>q
keymap("n", "<Space>q", ":<C-u>q!<Return>", opts)

-- Stop highligh by double ESC
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

-- Press jk fast to exit insert mode
keymap("i", "jj", "<ESC>", opts)

-- Insert <Space> after comma
keymap("i", ",", ",<Space>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Nvim-tree
--keymap("n", "<C-i>", ":NvimTreeToggle<Return>", opts)
vim.keymap.set('n', '<C-i>', require("nvim-tree.api").tree.toggle, {})

-- Telescope.nvim
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Toggleterm.nvim
vim.keymap.set('n', '<leader>tt', [[:ToggleTerm<CR>]], opts)

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- LazyGit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true
})

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", opts)

-- Coc
-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})

