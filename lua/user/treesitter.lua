local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
-- one of "all" or a list of languages
	ensure_installed = "all",
-- List of parsers to ignore installing
	ignore_install = { "" },
	highlight = {
-- false will disable the whole extension
		enable = true,
-- list of language that will be disabled
		disable = { "css" },
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})
