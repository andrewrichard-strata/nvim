local ts = require("nvim-treesitter")

ts.setup()

local parsers = {
  "python",
  "lua",
  "rust",
  "sql",
  "bash",
}

ts.install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  pattern = parsers,
  callback = function()
    vim.treesitter.start()
  end,
})
