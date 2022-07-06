local v = vim.opt


v.filetype = "on"
-- creates a backup file
v.backup = false
-- allows neovim to access the system clipboard
v.clipboard = "unnamedplus"
-- more space in the neovim command line for displaying messages
v.cmdheight = 1
-- mostly just for cmp
v.completeopt = { "menuone", "noselect" }
-- so that `` is visible in markdown files
v.conceallevel = 0
-- the encoding written to a file
v.fileencoding = "utf-8"
-- show matching words during a search
v.showmatch = true
-- highlight all matches on previous search pattern
v.hlsearch = true
-- ignore case in search patterns
v.ignorecase = true
-- allow the mouse to be used in neovim
v.mouse = "a"
-- pop up menu height
v.pumheight = 10
-- we don't need to see things like -- INSERT -- anymore
v.showmode = false
-- always show tabs
v.showtabline = 0
-- smart case
v.smartcase = true
-- make indenting smarter again
v.softtabstop = 4
v.smartindent = true
v.autoindent = true
-- force all horizontal splits to go below current window
v.splitbelow = true
-- force all vertical splits to go to the right of current window
v.splitright = true
-- creates a swapfile
v.swapfile = false
-- set term gui colors (most terminals support this)
v.termguicolors = true
-- time to wait for a mapped sequence to complete (in milliseconds)
v.timeoutlen = 1000
-- enable persistent undo
v.undofile = true
-- faster completion (4000ms default)
v.updatetime = 300
-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
v.writebackup = false
-- convert tabs to spaces
v.expandtab = true
v.gdefault = true
-- the number of spaces inserted for each indentation
v.shiftwidth = 2
-- insert 2 spaces for a tab
v.tabstop = 2
-- highlight the current line
v.cursorline = true
-- set numbered lines
v.number = true
-- set relatively numbered lines
v.relativenumber = true
v.laststatus = 3
v.showcmd = false
v.ruler = false
-- set number column width to 2 {default 4}
v.numberwidth = 4
-- always show the sign column, otherwise it would shift the text each time
v.signcolumn = "yes"
-- handle long lines correctly
v.wrap = true
v.textwidth = 79
v.formatoptions = "qrn1"
-- is one of my fav
v.scrolloff = 8
v.sidescrolloff = 8
v.hidden = true
-- the font used in graphical neovim applications
v.guifont = "monospace:h17"
v.fillchars.eob=" "
v.shortmess:append "c"
v.whichwrap:append("<,>,[,],h,l")
v.iskeyword:append("-")

v.incsearch = true
