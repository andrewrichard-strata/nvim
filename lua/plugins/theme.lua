-- rose pine
require("rose-pine").setup({
	styles = {
		transparency = true,
	},
})
-- tokyonight
require("tokyonight").setup({})

-- replace with selected colorscheme
vim.cmd.colorscheme("tokyonight")
