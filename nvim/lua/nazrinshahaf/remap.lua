vim.g.mapleader = " "

-- rebind for netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- smart moving a like with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursor stays in pos when joining
vim.keymap.set("n", "J", "mzJ`z")

-- when i go down or up center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- center search when incrementing
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without replacing buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- delete to void
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- yank into clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- format document
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- change permission to file to be executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Change all instances of word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- quickfix nav
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- keybind for moving between windows
-- vim.keymap.set("n", "<C-k>", "<C-W><C-K>")
-- vim.keymap.set("n", "<C-j>", "<C-W><C-J>")
-- vim.keymap.set("n", "<C-h>", "<C-W><C-H>")
-- vim.keymap.set("n", "<C-l>", "<C-W><C-L>")

-- moving between buffer
vim.keymap.set("n", "<leader>k", "gT")
vim.keymap.set("n", "<leader>j", "gt")
