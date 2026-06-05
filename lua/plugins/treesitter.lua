local ts = require("nvim-treesitter")

ts.setup()

local parsers = {
	"python",
	"lua",
	"rust",
	"sql",
	"bash",
  "markdown",
  "html",
  "latex",
  "yaml",
}

ts.install(parsers)

local disabled = {
	vim = true,
	vimdoc = true,
	help = true,
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = parsers,
	callback = function(args)
		local ft = vim.bo[args.buf].filetype

		if disabled[ft] then
			return
		end

		pcall(vim.treesitter.start, args.buf)
	end,
})
