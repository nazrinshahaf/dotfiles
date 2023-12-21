vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])
vim.keymap.set('n', '<leader>ot', ':FlutterOutlineToggle<CR>', { noremap = true, silent = true })
