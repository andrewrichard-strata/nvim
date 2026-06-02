require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"python",
		"lua",
		"rust",
		"sql",
		"bash",
	},
	auto_install = true,
	highlight = {
		enable = true,
		disable = { "vim", "vimdoc" },
	},
	indent = {
		enable = true,
	},
})
