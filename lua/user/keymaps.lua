-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- ctrl-h/j/k/l window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader> ", "<cmd>nohlsearch<CR>", opts)

-- Close buffers NTS - dangerous
-- keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste (clipboard)
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to exit insert
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --
-- NvimTree
-- consider F3 instead?
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)


    -- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.blockwise(vim.fn.visualmode())<CR>', opts)

-- Center the cursor vertically when moving to the next word in a search
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- normalize the . command
keymap("v", ".", ":norm.<CR>")

-- tmux sessionizer
-- keymap("n", "<C-f>", "!tmux neww ~/tmux-sessionizer<CR>", opts)

-- tab easier to hit than % for brackets pairing
keymap("n", "<tab>", "%", opts)
keymap("v", "<tab>", "%", opts)

-- strip trailing whitespace
keymap("n", "<leader>W", ":%s/\\s\\+$//e<CR>", opts)

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>q', vim.diagnostic.setloclist)

-- undo tree
keymap('n', '<leader>u', vim.cmd.UndotreeToggle)
