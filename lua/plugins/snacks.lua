require("snacks").setup({
	gh = { enabled = true },
	picker = {
		enabled = true,
		sources = {
			gh_issue = {},
			gh_pr = {},
		},
	},
})
