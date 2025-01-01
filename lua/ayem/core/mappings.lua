local keymap = vim.keymap
local opts = { silent = true, noremap = true }

keymap.set('n', '<C-e>', '<CMD>Explore<CR>', opts)
keymap.set('n', '<C-a>', 'ggVG', opts)
keymap.set('n', '<A-x>', '<CMD>bdelete<CR>', opts)
