local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Add to harpoon
vim.keymap.set("n", "<leader>a", mark.add_file)
-- Open Harpoon
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

-- Option + 1-4 fast swap to page
vim.keymap.set("n", "<A-1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<A-2>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<A-3>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<A-4>", function() ui.nav_file(4) end)
