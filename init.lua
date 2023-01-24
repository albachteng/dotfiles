require "user.keymaps"
require "user.plugins"
require "user.options"
require "user.autocommands"
require "user.colorscheme"
require "user.cmp"
require "user.harpoon"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.illuminate"
require "user.indentline"
require "user.lsp"
require "user.dap"

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}
-- Setup neovim lua configuration
require('neodev').setup()
require "user.mason"

-- Turn on lsp status information
require('fidget').setup()
