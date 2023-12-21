local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ef', builtin.help_tags, {})

-- enable flutter-tools telescope integration
require("telescope").load_extension "flutter"
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope flutter commands<CR>', {})
