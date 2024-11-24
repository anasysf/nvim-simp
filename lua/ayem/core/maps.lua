local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<C-e>', '<CMD>Explore<CR>', opts)
keymap.set('n', '<A-x>', '<CMD>bdelete<CR>', opts)
keymap.set('n', '<C-a>', 'ggVG', opts)
keymap.set('i', '<C-u>', '<ESC>viwUea', opts)
keymap.set('n', '<C-u>', 'viwUea', opts)
