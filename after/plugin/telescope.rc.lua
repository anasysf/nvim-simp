local ok, builtin = pcall(require, 'telescope.builtin')
if not ok then
    return vim.notify('COULD NOT LOAD TELESCOPE [BUILTIN]', vim.log.levels.ERROR, { title = 'TELESCOPE [BUILTIN]' })
end

local keymap = vim.keymap

keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files', silent = true })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep', silent = true })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers', silent = true })
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags', silent = true })
