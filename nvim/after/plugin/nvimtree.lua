require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

-- toggle tree
vim.keymap.set("n", "<leader>t", "<cmd>:NvimTreeToggle<CR>")
