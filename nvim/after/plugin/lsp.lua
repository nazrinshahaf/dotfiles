local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local luasnip = require('luasnip')
local lspkind = require('lspkind')

lsp.preset("recommended")
lsp.ensure_installed({
	"tsserver",
	"eslint",
	"rust_analyzer",
})

-- Fixes vim not a global varaible in lua
lsp.configure('lua_ls', {
	cmd = { 'lua-language-server' },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		},
	},
})
-- Fixes vim not a global varaible in lua

-- symbols for neovim --
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- symbols for neovim --

-- bind for error diagnostic
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>en', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ep', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fe', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
-- bind for error diagnostic

-- format on save --
lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		['lua_ls'] = { 'lua' },
		['rust_analyzer'] = { 'rust' },
	}
})
-- format on save --

lsp.setup()


-- for LuaSnip --
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
-- for LuaSnip --


-- for window width(consider install lspkind) --
-- local ELLIPSIS_CHAR = '…'
-- local MAX_LABEL_WIDTH = 10
-- -- local MAX_KIND_WIDTH = 14
-- local get_ws = function (max, len)
--   return (" "):rep(max - len)
-- end
--
-- local plsformat = function(_, item)
--   local content = item.abbr
--   -- local kind_symbol = symbols[item.kind]
--   -- item.kind = kind_symbol .. get_ws(MAX_KIND_WIDTH, #kind_symbol)
--
--   if #content > MAX_LABEL_WIDTH then
--     item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
--   else
--     item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
--   end
--
--   return item
-- end
-- for window width(consider install lspkind) --

cmp.setup({
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp', max_item_count = 12 },
		{ name = 'buffer',  keyword_length = 3 },
		{ name = 'luasnip', keyword_length = 2 },
	},
	mapping = {
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({ select = false }),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Tab to go to next snippet jumpable if autocomplete is not open
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		-- S-Tab to go to previous snippet jumpable if autocomplete is not open
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		-- Navigate between snippet placeholder
		['<C-n>'] = cmp_action.luasnip_jump_forward(),
		['<C-p>'] = cmp_action.luasnip_jump_backward(),
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 40, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
		})
  }
	-- formatting = {
	-- 	format = function(entry, vim_item)
	-- 		vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
	-- 		return vim_item
	-- 	end
	-- }
})
