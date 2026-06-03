local map = function(mode, key, fn, desc)
	vim.keymap.set(mode, key, fn, { silent = true, noremap = true, desc = desc })
end

local floating = require("utils.floating-windows")
-- vim.api.nvim_create_user_command("Floaterminal", floating.toggle_floating_terminal, {})
vim.api.nvim_create_user_command("BottomTerm", floating.toggle_bottom_terminal, {})
vim.api.nvim_create_user_command("Messages", floating.show_messages, {})

-- Toggle line numbers
map("n", "<leader>t3", function()
	local number = vim.wo.number
	local relativenumber = vim.wo.relativenumber

	if number or relativenumber then
		vim.wo.number = false
		vim.wo.relativenumber = false
	else
		vim.wo.number = true
		vim.wo.relativenumber = true
	end
end, "Toggle relative and absolute numbers")

map({ "n", "i", "t", "v" }, "<leader>tf", floating.toggle_floating_terminal, "toggle floating terminal")
map({ "n", "i", "t", "v" }, "<leader>tb", floating.toggle_bottom_terminal, "toggle bottom terminal")
map({ "n", "i", "t", "v" }, "<C-M-b>", floating.toggle_right_terminal, "toggle right split opencode")
map("n", "<leader>n", floating.show_messages, "Show messages")

-- Netrw file explorer
map("n", "<leader>e", ":Explore<cr>", "toggle netrw left split explorer")

-- Insert mode
map("i", "jk", "<ESC>", "exit insert mode")

-- X mode
map("x", "p", [["_dP"]], "Paste without losing yanked selection")

-- Normal mode
map("n", "<C-d>", "<C-d>zz", "scroll down centered")
map("n", "<C-u>", "<C-u>zz", "scroll up centered")
map("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "replace word under cursor")

vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })

vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

-- Visual mode
map("v", "J", ":m '>+1<CR>gv=gv", "move selection down")
map("v", "K", ":m '<-2<CR>gv=gv", "move selection up")
map("v", ">", ">gv", "indent keep selection")
map("v", "<", "<gv", "dedent keep selection")

-- Lines
map("n", "<leader>o", "o<ESC>", "new line under")
map("n", "<leader>O", "O<ESC>", "new line above")
map("n", "G", "Gzz", "center after jumpto end")

-- Execute
map("n", "<space><space>x", "<cmd>source %<CR>", "source current file")
map("n", "<space><space>c", "<cmd>source ~/AppData/Local/nvim/init.lua<CR>", "source init.lua")

-- Tabs
map("n", "<leader>to", "<cmd>tabnew<CR>", "Open new tab")
map("n", "<leader>tw", "<cmd>tabclose<CR>", "Close tab")
map("n", "<leader>tn", "<cmd>tabn<CR>", "Next tab")
map("n", "<leader>tp", "<cmd>tabp<CR>", "Previous tab")
map("n", "<leader>tf", "<cmd>tabnew %<CR>", "Open buffer in new tab")

-- Text wrapping
map("n", "<leader>wp", "<cmd>setlocal wrap<CR>", "Enable text wrap")

-- Terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- Delete marks
map("n", "<leader>dm", function()
	vim.cmd("delmarks!")
	print("all marks deleted")
end, "delete all marks")

-- local indent = require("blink.indent")
-- map("n", "<leader>ii", function()
--   indent.enable(not indent.is_enabled())
-- end, "Toggle indent guides")
--
--
-- Trouble diagnostics
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>xX",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	{ desc = "Buffer Diagnostics (Trouble)" }
)
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

--Github via Snacks.gh
map("n", "<leader>gi", function()
	Snacks.picker.gh_issue()
end, "GitHub Issues (open)")

map("n", "<leader>gI", function()
	Snacks.picker.gh_issue({ state = "all" })
end, "GitHub Issues (all)")

map("n", "<leader>gp", function()
	Snacks.picker.gh_pr()
end, "GitHub Pull Requests (open)")

map("n", "<leader>gP", function()
	Snacks.picker.gh_pr({ state = "all" })
end, "GitHub Pull Requests (all)")
