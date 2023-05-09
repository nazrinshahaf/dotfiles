local lsp = require('lsp-zero').preset({})

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"rust_analyzer",
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	sources = {
		{name = 'path'},
		{name = 'nvim_lsp'},
		{name = 'buffer', keyword_length = 3},
		{name = 'luasnip', keyword_length = 2},
	},
	mapping = {
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({select = false}),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		['<C-n>'] = cmp_action.luasnip_jump_forward(),
		['<C-p>'] = cmp_action.luasnip_jump_backward(),
	}
})

-- symbols for neovim
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>en', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ep', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fe', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })

lsp.setup()
